//
//  AuthTokenRequest.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

/// An enum that defines the API request for obtaining an authentication token, conforming to `RequestProtocol`.
enum AuthTokenRequest: RequestProtocol {
    /// Retrieves an authentication token from the API.
    case auth
    
    ///The API endpoint path for position-related requests.
    var path: String {
        "/api/v1/token"
    }
    
    /// HTTP method for the request.
    var requestType: RequestType {
        .GET
    }
}
