//
//  RequestManager+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

extension RequestManagerProtocol {
    var parser: DataParserProtocol {
        return DataParser()
    }
}
