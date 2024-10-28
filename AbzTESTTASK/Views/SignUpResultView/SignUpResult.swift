//
//  SignUpResult.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 27.10.2024.
//

import Foundation

enum SignUpResult {
    case success
    case failure
}

// Conforming to hashable
extension SignUpResult: Hashable {}

// Conforming to identifiable
extension SignUpResult: Identifiable {
    var id: UUID { UUID() }
}
