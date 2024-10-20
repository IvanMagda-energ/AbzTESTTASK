//
//  NewUser.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 19.10.2024.
//

import Foundation

struct NewUser: Encodable {
    let name: String
    let email: String
    let phone: String
    let positionId: Int
    let photo: Data
}
