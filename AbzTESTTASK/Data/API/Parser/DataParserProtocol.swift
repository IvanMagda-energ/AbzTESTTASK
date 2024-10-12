//
//  DataParserProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol DataParserProtocol {
    /// Parses raw data into a specified decodable type.
    /// - Parameter data: The raw `Data` to be parsed and decoded. This should represent a valid encoded format that
    ///   matches the structure of the expected type `T`.
    /// - Returns: An instance of type `T`, which is the decoded object resulting from parsing the raw data.
  func parse<T: Decodable>(data: Data) throws -> T
}
