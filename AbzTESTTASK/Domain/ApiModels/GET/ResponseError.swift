//
//  ResponseError.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 27.10.2024.
//

import Foundation

// MARK: - Responce
struct ResponseError: Decodable {
    let success: Bool
    let message: String
    let fails: Fails?
    // MARK: - Fails
    struct Fails: Decodable {
        let name: [String]?
        let email: [String]?
        let phone: [String]?
        let positionId: [String]?
        let photo: [String]?
        let count: [String]?
        let page: [String]?
        let userId: [String]?
    }
}
