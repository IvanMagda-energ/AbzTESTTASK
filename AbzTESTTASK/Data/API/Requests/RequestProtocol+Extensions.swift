//
//  RequestProtocol+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

extension RequestProtocol {
    var host: String { APIConstants.baseHost }
    
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
