//
//  UserListResponse.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

struct UserListResponse: Codable {
    let success: Bool
    let totalPages: Int
    let totalUsers: Int
    let count: Int
    let page: Int
    let links: [String: String?]
    let users: [User]
}
