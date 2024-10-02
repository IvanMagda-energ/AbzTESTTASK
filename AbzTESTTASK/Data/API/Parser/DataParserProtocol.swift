//
//  DataParserProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol DataParserProtocol {
  func parse<T: Decodable>(data: Data) throws -> T
}
