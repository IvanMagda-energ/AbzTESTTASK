//
//  RequestManager+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

extension RequestManagerProtocol {
    /// This computed property returns an instance of `DataParser`, which conforms to `DataParserProtocol`.
    /// The parser is used to handle and decode network response data into usable formats, such as JSON or other
    /// structured data types.
    var parser: DataParserProtocol {
        return DataParser()
    }
}
