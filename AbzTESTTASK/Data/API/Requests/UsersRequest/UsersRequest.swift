//
//  UsersRequest.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

/// This enum conforms to the `RequestProtocol` and defines the necessary components for making requests
/// to fetch user data from the API.
enum UsersRequest: RequestProtocol {
    case getUsers(page: Int, count: Int)
    
    var path: String {
        return "/api/v1/users"
    }
    
    var addAuthorisationToken: Bool {
        false
    }
    
    var requestType: RequestType {
        .GET
    }
    
    var urlParams: [String : String?] {
        switch self {
        case .getUsers(let page, let count):
            let params: [String: String] = [
                "page": String(page),
                "count": String(count)
            ]
            return params
        }
    }
}
