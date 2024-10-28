//
//  MockRequestManager.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 28.10.2024.
//

import Foundation

class MockRequestManager: RequestManagerProtocol {
    
    /// Mocks the process of requesting an access token.
    ///
    /// - Returns: An empty string, simulating a token response.
    func requestAccessToken() async throws -> String {
        return ""
    }
    
    /// Mocks the process of initializing and executing an API request.
    ///
    /// This method checks the expected response type (`T`) and provides a mock response for each type:
    ///
    /// - Parameter data: An object conforming to `RequestProtocol`, defining the request's details.
    /// - Returns: A decoded object of type `T`, populated from mock data.
    func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T {
        var decoded: T?
        switch T.self {
        case is UsersResponse.Type:
            decoded = MockUserData.userResponse as? T
        case is PositionsResponse.Type:
            decoded = MockUserData.positionsResponse as? T
        case is SignUpResponse.Type:
            decoded = MockUserData.signUpResponse as? T
        default:
            break
        }
        
        guard let decoded else {
            throw NetworkError.invalidServerResponse
        }
        return decoded
    }
}
