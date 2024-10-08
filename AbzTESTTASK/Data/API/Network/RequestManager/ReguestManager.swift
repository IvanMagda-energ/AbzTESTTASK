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
    
    func requestAccessToken() async throws -> String {
        let data = try await apiManager.initRequest(with: AuthTokenRequest.auth, authToken: "")
        let token: APIToken = try parser.parse(data: data)
        return token.token
    }
    
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
