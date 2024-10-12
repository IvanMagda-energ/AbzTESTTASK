//
//  NetworkError.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

/// An enumeration representing possible network-related errors.
public enum NetworkError: Error {
    /// Indicates that the server's response was invalid or could not be processed.
    case invalidServerResponse
    /// Indicates that the provided URL was not valid and could not be used for a request.
    case invalidUrl
}
