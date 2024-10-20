//
//  UserPositionsRequest.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import Foundation

/// This enum conforms to the `RequestProtocol` and defines the necessary components for making requests
/// to fetch user positions data from the API.
enum UserPositionsRequest: RequestProtocol {
    case getPositions
    
    var path: String {
        return "/api/v1/positions"
    }
    
    var addAuthorisationToken: Bool {
        false
    }
    
    var requestType: RequestType {
        .GET
    }
}

