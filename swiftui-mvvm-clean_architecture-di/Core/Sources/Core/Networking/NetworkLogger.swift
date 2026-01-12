import Foundation
enum NetworkLogger {
    static func logRequest(_ request: URLRequest) {
        print("➡️ REQUEST")
        print("URL: \(request.httpMethod ?? "GET") \(request.url?.absoluteString ?? "")")
        if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
            print("Headers: \(headers)")
        }
        if let body = request.httpBody, !body.isEmpty {
            print("Body:")
            if let json = try? JSONSerialization.jsonObject(with: body),
               let pretty = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
               let str = String(data: pretty, encoding: .utf8) {
                print(str)
            } else {
                print(String(data: body, encoding: .utf8) ?? "<\(body.count) bytes>")
            }
        }
    }
    
    static func logResponse(_ response: URLResponse, data: Data) {
        guard let http = response as? HTTPURLResponse else {
            print("⬅️ RESPONSE: non-HTTP \(response)")
            return
        }
        print("⬅️ RESPONSE \(http.statusCode) from \(http.url?.absoluteString ?? "")")
        if !http.allHeaderFields.isEmpty {
            print("Headers: \(http.allHeaderFields)")
        }
        if !data.isEmpty {
            if let json = try? JSONSerialization.jsonObject(with: data),
               let pretty = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
               let str = String(data: pretty, encoding: .utf8) {
                print("Body:\n\(str)")
            } else {
                print("Body (raw):\n\(String(data: data, encoding: .utf8) ?? "<\(data.count) bytes>")")
            }
        }
    }
    
    static func logDecodeError(_ error: Error) {
        if case let DecodingError.dataCorrupted(ctx) = error {
            print("❌ DecodingError.dataCorrupted:", ctx.debugDescription)
        } else if case let DecodingError.keyNotFound(key, ctx) = error {
            print("❌ keyNotFound \(key.stringValue):", ctx.debugDescription)
        } else if case let DecodingError.typeMismatch(type, ctx) = error {
            print("❌ typeMismatch \(type):", ctx.debugDescription)
        } else if case let DecodingError.valueNotFound(type, ctx) = error {
            print("❌ valueNotFound \(type):", ctx.debugDescription)
        } else {
            print("❌ Decode error:", error)
        }
    }
    
    
}

