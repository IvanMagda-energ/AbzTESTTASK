//
//  ApiManagerProtocol+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 27.10.2024.
//

import Foundation

extension APIManagerProtocol {
    /// This computed property returns an instance of `DataParser`, which conforms to `DataParserProtocol`.
    /// The parser is used to handle and decode network response data into usable formats, such as JSON or other
    /// structured data types.
    var parser: DataParserProtocol {
        return DataParser()
    }
}
