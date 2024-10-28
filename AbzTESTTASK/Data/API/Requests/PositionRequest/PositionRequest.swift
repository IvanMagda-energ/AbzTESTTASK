//
//  PositionsRequest.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import Foundation

/// An enum that defines the request for fetching user positions, conforming to `RequestProtocol`.
enum PositionRequest: RequestProtocol {
    /// Retrieves a list of user positions from the API.
    case getPositions
    
    /// The API endpoint path for position-related requests.
    var path: String {
        return "/api/v1/positions"
    }
    
    /// Whether the request requires an authorization token.
    var addAuthorisationToken: Bool {
        false
    }
    
    /// HTTP method for the request.
    var requestType: RequestType {
        .GET
    }
}
