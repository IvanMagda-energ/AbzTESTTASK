//
//  NetworkError.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

/// An enumeration representing possible network-related errors.
enum NetworkError: Error {
    /// Indicates that the server's response was invalid or could not be processed.
    case invalidServerResponse
    /// Indicates that the provided URL was not valid and could not be used for a request.
    case invalidUrl
    /// The request failed due to an expired authorization token.
    case unauthorizedTokenExpired(ResponseError)
    /// The user is already registered.
    case userAlreadyRegistered(ResponseError)
    /// Validation of the request data failed.
    case validationFailed(ResponseError)
    /// The requested resource was not found.
    case notFound(ResponseError)
}
