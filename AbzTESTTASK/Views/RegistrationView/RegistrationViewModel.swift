//
//  RegistrationViewModel.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI
import os

@Observable
final class RegistrationViewModel {
    private let logger = Logger(
        subsystem: String(describing: Bundle.main.bundleIdentifier),
        category: String(describing: RegistrationViewModel.self)
    )
    
    private(set) var positions = [Position]()
    
    var error: ViewModelLocalizedError?
    var hasError = false
    private(set) var isLoading = false
    
    private let requestManager: RequestManagerProtocol
        
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
    
    @MainActor
    func getPositions() async {
        guard !isLoading  else {
            logger.info("\(#function) Request blocked: already loading positions.")
            return
        }
        
        defer {
            isLoading = false
        }
        
        logger.info("\(#function) Starting request for user positions.")
        do {
            isLoading = true
            
            let request = PositionRequest.getPositions
            let result: PositionsResponse = try await requestManager.initRequest(with: request)
            positions.append(contentsOf: result.positions)
            logger.info("\(#function) Request for position completed, successful fetched \(self.positions.count) items.")
        } catch {
            self.error = ViewModelLocalizedError.failedToGetPositions(error)
            self.hasError = true
            logger.info("\(#function) Failed to get positions with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signUp(_ userInfo: UserInfo) async {
        guard !isLoading  else {
            logger.info("\(#function) Request blocked: a new user registration is in progress.")
            return
        }
        
        defer {
            isLoading = false
        }
        
        do {
            let request = UsersRequests.signUp(userInfo)
            let response: SignUpResponse = try await requestManager.initRequest(with: request)
            logger.info("\(#function) \(response.message), userId: \(response.userId)")
        } catch {
            self.error = .failedSignUp(error)
            self.hasError = true
        }
    }
}

extension RegistrationViewModel {
    enum ViewModelLocalizedError: LocalizedError {
        case failedToGetPositions(Error)
        case failedSignUp(Error)
        
        public var errorDescription: String? {
            switch self {
            case .failedToGetPositions:
                return NSLocalizedString(
                    "failed.to.get.positions.error.description",
                    value: "Failed to get users.",
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
