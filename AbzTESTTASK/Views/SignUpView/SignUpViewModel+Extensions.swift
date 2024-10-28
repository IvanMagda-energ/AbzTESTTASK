//
//  SignUpViewModel+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 28.10.2024.
//

import Foundation

extension SignUpViewModel {
    enum ViewModelLocalizedError: LocalizedError {
        case failedToGetPositions(Error)
        case failedSignUp(Error)
        
        public var errorDescription: String? {
            switch self {
            case .failedToGetPositions:
                return NSLocalizedString(
                    "failed.to.get.positions.error.description",
                    value: "Failed to get positions.",
                    comment: "Failed to get positions error"
                )
            case .failedSignUp:
                return NSLocalizedString(
                    "failed.to.sign.up.error.description",
                    value: "Failed to sign up user.",
                    comment: "Error description when failed to sign up user"
                )
            }
        }
        
        public var failureReason: String? {
            switch self {
            case .failedToGetPositions(let error):
                return String(
                    format: NSLocalizedString(
                        "failed.to.get.positions.failure.reason %@",
                        comment: "Failed to get positions failure reason"
                    ),
                    error.localizedDescription
                )
            case .failedSignUp(let error):
                return String(
                    format: NSLocalizedString(
                        "failed.to.sign.up.failure.reason %@",
                        comment: "Failure reason when failed to sign up user"
                    ),
                    error.localizedDescription
                )
            }
        }
        
        public var helpAnchor: String? {
            switch self {
            case .failedToGetPositions:
                return NSLocalizedString(
                    "failed.to.get.positions.help.anchor",
                    value: "Try again",
                    comment: "Help anchor when failed to get positions"
                )
            case .failedSignUp:
                return NSLocalizedString(
                    "failed.to.sign.up.help.anchor",
                    value: "Check that all required fields are correct and try again.",
                    comment: "Help anchor when failed to sign up user"
                )
            }
        }
    }
}

