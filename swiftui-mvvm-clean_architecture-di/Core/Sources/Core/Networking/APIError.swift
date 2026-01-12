import Foundation

public enum APIError : Error , LocalizedError {
    // Server side
    case invalidURL
    case badResponse(error: String? = nil)
    case internalServerError
    case unauthorized
    case unknow(error: String? = nil)
    
    // local
    case noInternetConnection
    case decoderError(error: String? = nil)
    case timeOut
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL : return "Invalid URL"
        case .badResponse(let error) : return error ?? "bad Response"
        case .internalServerError : return "Internal Server Error"
        case .unauthorized : return "Unothorized"
        case .noInternetConnection : return "No Connection , Please check your intent and try again"
        case .decoderError(let error) : return error ?? "Application Error"
        case .timeOut: return "Time Out Error"
        case .unknow(let error) : return error ?? "Unknown Error"
        }
    }
}
