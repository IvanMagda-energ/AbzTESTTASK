//
//  ReguestManager.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    
    /// This method implement sending a network request to obtain an access token, which is required for authorized API requests.
    /// The access token is returned as a string upon successful retrieval. If the request fails, it throws an error
    /// that can be handled by the caller.
    /// - Returns: A `String` representing the access token required for authenticated requests.
    func requestAccessToken() async throws -> String {
        let data = try await apiManager.initRequest(with: AuthTokenRequest.auth, authToken: "")
        let token: APIToken = try parser.parse(data: data)
        return token.token
    }
    
    /// This method implement a network request based on the provided `RequestProtocol` object and decodes the response
    /// into the specified generic type `T`, which must conform to `Decodable`. If the request is successful, it returns
    /// the decoded object. If it fails, it throws an error.
    /// - Parameter data: The request data conforming to `RequestProtocol`, which includes all necessary details like
    ///   the endpoint, method, and parameters for the request.
    /// - Returns: A decoded object of type `T`, representing the data received from the server.
    func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T {
        var authToken = ""
        if data.addAuthorisationToken {
            authToken = try await requestAccessToken()
        }
        let data = try await apiManager.initRequest(with: data, authToken: authToken)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}

extension RequestManager {
    static func createManager() -> RequestManagerProtocol {
#if DEBUG
        return MockRequestManager()
#else
        return self
#endif
    }
}
