//
//  UsersRequests.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

/// This enum conforms to the `RequestProtocol` and defines the necessary components for making requests
/// to fetch user data or register a new user via the API.
enum UsersRequests: RequestProtocol {
    case getUsers(page: Int, count: Int)
    case signUp(_ userInfo: UserInfo)
        
    /// The API endpoint path for all user-related requests as `String`.
    var path: String {
        return "/api/v1/users"
    }
    
    /// Indicates whether an authorization token is required for the request as `Bool`.
    var addAuthorisationToken: Bool {
        switch self {
        case .getUsers:
            return false
        case .signUp:
            return true
        }
    }
    
    /// The HTTP method to be used for the request as `RequestType`.
    var requestType: RequestType {
        switch self {
        case .getUsers:
            return .GET
        case .signUp:
            return .POST
        }
    }
    
    /// Headers to be included in the request as `[String: String]`
    var headers: [String : String] {
        switch self {
        case .getUsers:
            return [:]
        case .signUp:
            return [
                "Accept": "application/json"
            ]
        }
    }
    
    /// URL parameters to be included in the request as `[String: String]`.
    var urlParams: [String : String?] {
        switch self {
        case .getUsers(let page, let count):
            return [
                "page": String(page),
                "count": String(count)
            ]
        case .signUp:
            return [:]
        }
    }
    
    var multipartFormRequest: MultipartRequest? {
        switch self {
        case .signUp(let userInfo):
            var multipart = MultipartRequest()
            multipart.add(key: "name", value: userInfo.name)
            multipart.add(key: "email", value: userInfo.email)
            multipart.add(key: "phone", value: userInfo.phone)
            multipart.add(key: "position_id", value: userInfo.positionId.description)
            multipart.add(
                key: "photo",
                fileName: UUID().uuidString,
                fileMimeType: "image/jpeg",
                fileData: userInfo.imageData
            )
            return multipart
        default:
            return nil
        }
    }
}
