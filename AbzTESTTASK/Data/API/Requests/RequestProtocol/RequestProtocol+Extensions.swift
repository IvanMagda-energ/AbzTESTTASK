//
//  RequestProtocol+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation
/// Request protocol default implementation
extension RequestProtocol {
    var host: String {
        APIConstants.baseUrl
    }
    
    var addAuthorisationToken: Bool {
        return true
    }
    
    var params: [String: Any] {
        return [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var headers: [String: String] {
        [:]
    }
    
    /// This method constructs a `URLRequest` using the host, path, HTTP method, headers, and any
    /// parameters defined in the conforming type. It also adds an authorization token to the request
    /// if `addAuthorisationToken` is true.
    /// - Parameter authToken: A `String` representing the authorization token to be included in the request header.
    /// - Returns: A `URLRequest` configured with the specified parameters.
    func request(authToken: String) throws -> URLRequest {
        var component = URLComponents()
        component.scheme = "https"
        component.host = host
        component.path = path
        
        if !urlParams.isEmpty {
            component.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = component.url else {
            throw NetworkError.invalidUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAuthorisationToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}
