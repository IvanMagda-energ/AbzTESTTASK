//
//  ApiManager.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    private let connectionMonitor: NetworkConnectionMonitor
    
    init(urlSession: URLSession = URLSession.shared,
         connectionMonitor: NetworkConnectionMonitor = NetworkConnectionMonitor.shared) {
        self.urlSession = urlSession
        self.connectionMonitor = connectionMonitor
    }
    
    /// This method implement constructing and sending a network request based on the provided `RequestProtocol` object and the
    /// authentication token. It asynchronously waits for the response and returns the resulting `Data` if the request succeeds.
    /// If the request fails, it throws an error that can be handled by the caller.
    /// - Parameters:
    ///   - data: The request data conforming to `RequestProtocol`, which contains all necessary details (e.g., endpoint, parameters, method).
    ///   - authToken: A string representing the authentication token to be included in the request headers for authorization.
    /// - Returns: The raw `Data` object received from the server if the request is successful.
    func initRequest(with data: RequestProtocol, authToken: String = "") async throws -> Data {
        connectionMonitor.checkConnection()
        let (data, response) = try await urlSession.data(for: data.request(authToken: authToken))
        try validateResponse(data: data, response: response)
        return data
    }
    
    private func validateResponse(data: Data, response: URLResponse) throws {
        let httpResponse = response as? HTTPURLResponse
        
        switch httpResponse?.statusCode {
        case 200, 201:
            // Success
            return
        case 401:
            // Unauthorized
            let responseError: ResponseError = try parser.parse(data: data)
            throw NetworkError.unauthorizedTokenExpired(responseError)
        case 409:
            // User already registered
            let responseError: ResponseError = try parser.parse(data: data)
            throw NetworkError.userAlreadyRegistered(responseError)
        case 422:
            // Validation failed
            let responseError: ResponseError = try parser.parse(data: data)
            throw NetworkError.validationFailed(responseError)
        case 400, 404:
            // Not found
            let responseError: ResponseError = try parser.parse(data: data)
            throw NetworkError.notFound(responseError)
        default:
            throw NetworkError.invalidServerResponse
        }
    }
}
