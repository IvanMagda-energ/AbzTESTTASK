//
//  UsersRequests.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

/// An enum that defines requests for user-related actions, conforming to `RequestProtocol`.
enum UsersRequests: RequestProtocol {
    /// Fetches a paginated list of users with the specified page as `Int` and count as `Int`.
    case getUsers(page: Int, count: Int)
    /// Registers a new user with the given user information as `UserInfo`.
    case signUp(_ userInfo: UserInfo)
    
    /// The API endpoint path for user-related requests.
    var path: String {
        return "/api/v1/users"
    }
    
    /// Whether the request requires an authorization token.
    var addAuthorisationToken: Bool {
        switch self {
        case .getUsers:
            return false
        case .signUp:
            return true
        }
    }
    
    /// HTTP method for the request.
    var requestType: RequestType {
        switch self {
        case .getUsers:
            return .GET
        case .signUp:
            return .POST
        }
    }
    
    /// Request headers.
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
    
    /// URL parameters for the request.
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
    
    /// Configures multipart form data for `signUp` with user information.
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
