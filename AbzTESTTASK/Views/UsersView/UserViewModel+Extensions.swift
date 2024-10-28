//
//  UserViewModel+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 28.10.2024.
//

import Foundation

extension UsersViewModel {
    enum ViewModelLocalizedError: LocalizedError {
        case failedToGetUsers(Error)
        
        public var errorDescription: String? {
            switch self {
            case .failedToGetUsers:
                return NSLocalizedString(
                    "failed.to.get.users.error.description",
                    value: "Failed to get users.",
                    comment: "Failed to get users error"
                )
            }
        }
        
        public var failureReason: String? {
            switch self {
            case .failedToGetUsers(let error):
                return String(
                    format: NSLocalizedString(
                        "failed.to.get.users.failure.reason %@",
                        comment: "Failed to get users failure reason"
                    ),
                    error.localizedDescription
                )
            }
        }
        
        public var helpAnchor: String? {
            switch self {
            case .failedToGetUsers:
                return NSLocalizedString(
                    "failed.to.get.users.help.anchor",
                    value: "Try again",
                    comment: "Help anchor when failed to get users"
                )
            }
        }
    }
}
