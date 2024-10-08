//
//  RequestProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol RequestProtocol {
    var host: String { get }
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String: String] { get }
    var params: [String: Any]  { get }
    var urlParams: [String: String?] { get }
    var addAuthorisationToken: Bool { get }
}
