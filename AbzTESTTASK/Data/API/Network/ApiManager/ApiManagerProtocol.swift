//
//  ApiManagerProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol APIManagerProtocol {
    /// Sends an asynchronous request with the provided request data and authentication token.
    /// - Parameters:
    ///   - data: The request data conforming to `RequestProtocol`, which contains all necessary details (e.g., endpoint, parameters, method).
    ///   - authToken: A string representing the authentication token to be included in the request headers for authorization.
    /// - Returns: The raw `Data` object received from the server if the request is successful.
    func initRequest(with data: RequestProtocol, authToken: String) async throws -> Data
    
}
