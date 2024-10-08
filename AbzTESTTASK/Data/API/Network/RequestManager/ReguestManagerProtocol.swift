//
//  ReguestManagerProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol RequestManagerProtocol {
  var apiManager: APIManagerProtocol { get }
  var parser: DataParserProtocol { get }
  func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T
}
