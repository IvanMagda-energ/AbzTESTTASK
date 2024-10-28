//
//  UsersResponse.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

// MARK: - Responce
struct UsersResponse: Decodable {
    let success: Bool
    let totalPages: Int
    let totalUsers: Int
    let count: Int
    let page: Int
    let links: [String: String?]
    let users: [User]
}

// MARK: - User
struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let position: String
    let positionId: Int
    let registrationTimestamp: Int
    let photo: String
}

// MARK: - Conforming to Comparable
extension User: Comparable {
    var registrationDate: Date {
        Date(timeIntervalSince1970: Double(registrationTimestamp))
    }
    
    public static func < (lhs: User, rhs: User) -> Bool {
        return lhs.registrationDate < rhs.registrationDate
    }
}
