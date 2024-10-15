//
//  User.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let position: String
    let positionId: Int
    let registrationTimestamp: Int
    let photo: String
}

extension User: Comparable {
    var registrationDate: Date {
        Date(timeIntervalSince1970: Double(registrationTimestamp))
    }
    
    public static func < (lhs: User, rhs: User) -> Bool {
        return lhs.registrationDate < rhs.registrationDate
    }
}
