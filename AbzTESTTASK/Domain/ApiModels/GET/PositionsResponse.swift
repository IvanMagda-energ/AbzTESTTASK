//
//  PositionsResponse.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import Foundation

// MARK: - Responce
struct PositionsResponse: Decodable {
    let success: Bool
    let positions: [Position]
}

// MARK: - Position
struct Position: Codable, Identifiable {
    let id: Int
    let name: String
}

// MARK: - Conforming to equitable
extension Position: Equatable {}
