//
//  SignUpViewModel.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI
import os

@Observable
final class SignUpViewModel {
    private let logger = Logger(
        subsystem: String(describing: Bundle.main.bundleIdentifier),
        category: String(describing: SignUpViewModel.self)
    )
    
    private(set) var positions = [Position]()
    
    var error: ViewModelLocalizedError?
    var hasError = false
    var signUpResult: SignUpResult?
    private(set) var isLoading = false
    
    private let requestManager: RequestManagerProtocol
    
    /// <#Description#>
    /// - Parameter requestManager: <#requestManager description#>
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
    
    /// Asynchronously fetches available user positions.
    ///
    /// This method prevents duplicate requests by checking isLoading as `Bool`. If already in progress,
    /// it logs a message and exits. On success, fetched positions are appended to positions as `[Position]`.
    /// If an error occurs, `error` is set to display in the UI, and the error is logged.
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
            // If the user cannot influence the occurrence of the error and cannot fix it,
            // They do not need to know what kind of error has occurred. For debugging, we log the error.
            switch error as? NetworkError {
            case .notFound(let error):
                self.logger.error("\(#function) \(error.message)")
            default:
                break
            }
            
            self.error = ViewModelLocalizedError.failedToGetPositions(error)
            self.hasError = true
            logger.info("\(#function) Failed to get positions with error: \(error.localizedDescription)")
        }
    }
    
    /// Asynchronously signs up a new user using the provided information.
    ///
    /// - Parameter userInfo: The user's registration information as `UserInfo`.
    /// Prevents duplicate requests by checking `isLoading`; if a request is in progress, it logs and exits.
    /// On success, `signUpResult` is set to `.success` and logs the user ID. If an error occurs, sets `error` for UI display
    /// and logs details.
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
            self.signUpResult = .success
            logger.info("\(#function) \(response.message), userId: \(response.userId)")
        } catch {
            // Handle and logging network errors
            switch error as? NetworkError {
            case .unauthorizedTokenExpired(let error):
                self.logger.error("\(#function) \(error.message)")
            case .userAlreadyRegistered(let error):
                // Set to show appropriate screen.
                self.signUpResult = .failure
                self.logger.error("\(#function) \(error.message)")
            case .validationFailed(let error):
                var fails: String {
                    String(describing: error.fails?.name?.first) + "/n" +
                    String(describing: error.fails?.email?.first) + "/n" +
                    String(describing:error.fails?.phone?.first) + "/n" +
                    String(describing:error.fails?.position_id?.first) + "/n" +
                    String(describing:error.fails?.photo?.first)
                }
                self.logger.error("\(#function) \(error.message) \(fails)")
            default:
                break
            }
            self.error = .failedSignUp(error)
            self.hasError = true
        }
    }
}
