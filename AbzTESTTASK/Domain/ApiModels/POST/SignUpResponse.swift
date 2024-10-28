//
//  SignUpResponse.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 21.10.2024.
//

import Foundation

struct SignUpResponse: Decodable {
    let success: Bool
    let userId: Int
    let message: String
}
