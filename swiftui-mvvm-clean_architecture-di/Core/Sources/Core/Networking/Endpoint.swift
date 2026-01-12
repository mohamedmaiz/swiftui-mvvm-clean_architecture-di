import Foundation

public protocol Endpoint {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String : String]? {get}
    var queryParams: [URLQueryItem]? {get}
    var body: Data? {get}
}

public extension Endpoint {
    var baseURL: String {
        return "https://itunes.apple.com"
    }
    
    var header: [String : String]? {
        return ["Content-Type" : "pplication/json"]
    }
    
    var queryParams: [URLQueryItem]? {
        return nil
    }
    var body: Data? {
        return nil
    }
    
}

public extension Endpoint {
    func makeRequest() throws -> URLRequest {
        let url = URL(string: baseURL + path)
        guard let url = url else{ throw URLError(.badURL)}
        var component = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        component?.queryItems = queryParams
        
        guard let fullURL = component?.url else {throw URLError(.badURL)}
        
        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue
        
        if(method != .GET) {
            request.httpBody = body
        }
        
        header?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
}
