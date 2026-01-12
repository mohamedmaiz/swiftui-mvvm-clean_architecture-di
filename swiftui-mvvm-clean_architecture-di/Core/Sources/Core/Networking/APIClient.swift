
import Foundation
import Combine

public class APIClient {
    var session: URLSession = .shared
    var decoder: JSONDecoder {
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        return d
    }
    
    public init(){}
    
    public func run<T: Decodable>(_ type: T.Type , _ endpoint: Endpoint) -> AnyPublisher<T , APIError> {
        
        let request: URLRequest
        do{
            request =  try endpoint.makeRequest()
        }
        catch {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .handleEvents(receiveSubscription: { _ in
//                NetworkLogger.logRequest(request)
            })
            .tryMap({output -> Data in
//                NetworkLogger.logResponse(output.response, data: output.data)
                guard let response = output.response as? HTTPURLResponse else {
                    throw APIError.badResponse(error: "No response")
                }
                guard 200..<300 ~= response.statusCode else {
                    throw APIError.badResponse(error: response.description)
                }
                return output.data
            })
            .decode(type: T.self, decoder: decoder)
            .mapError({error -> APIError in
//                NetworkLogger.logDecodeError(error)
                if let api = error as? APIError {return api}
                if error is DecodingError {return .decoderError(error: "error to decode JSON TO DTO")}
                return .badResponse(error: error.localizedDescription)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

