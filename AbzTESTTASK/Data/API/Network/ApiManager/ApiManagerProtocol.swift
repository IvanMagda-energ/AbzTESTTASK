//
//  ApiManagerProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol APIManagerProtocol {
    func initRequest(with url: URL) async throws -> Data
    
}
