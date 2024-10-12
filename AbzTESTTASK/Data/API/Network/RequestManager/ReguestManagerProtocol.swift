//
//  ReguestManagerProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol RequestManagerProtocol {
    /// Provides a default data parser for processing network responses.
    var parser: DataParserProtocol { get }
    
    /// Asynchronously requests and retrieves an access token.
    /// - Returns: A `String` representing the access token required for authenticated requests.
    func requestAccessToken() async throws -> String
    
    /// Sends an asynchronous network request and decodes the response into a specified type.
    /// - Parameter data: The request data conforming to `RequestProtocol`, which includes all necessary details like
    ///   the endpoint, method, and parameters for the request.
    /// - Returns: A decoded object of type `T`, representing the data received from the server.
    func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T
}
