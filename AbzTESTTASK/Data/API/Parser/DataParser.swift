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
  }

  func parse<T: Decodable>(data: Data) throws -> T {
    return try jsonDecoder.decode(T.self, from: data)
  }
}
