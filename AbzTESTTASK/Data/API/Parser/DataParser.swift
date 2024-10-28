//
//  DataParser.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

class DataParser: DataParserProtocol {
    private var jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    /// This method implement decoding the provided `Data` into an instance of the specified type `T`, which must conform
    /// to the `Decodable` protocol. It is typically used to convert network response data into model objects.
    /// - Parameter data: The raw `Data` to be parsed and decoded. This should represent a valid encoded format that
    ///   matches the structure of the expected type `T`.
    /// - Returns: An instance of type `T`, which is the decoded object resulting from parsing the raw data.
    func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
