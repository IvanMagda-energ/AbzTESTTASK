//
//  RegistrationViewModel.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import Foundation
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
            logger.info("\(#function) Request for position completed, successful fetched \(self.positions.count) items.")
        }
        
        logger.info("\(#function) Starting request for user positions.")
        do {
            isLoading = true
            
            let request = UserPositionsRequest.getPositions
            let result: PositionsResponse = try await requestManager.initRequest(with: request)
            positions.append(contentsOf: result.positions)
        } catch {
            self.error = ViewModelLocalizedError.failedToGetPositions(error)
            self.hasError = true
            logger.info("\(#function) Failed to get positions with error: \(error.localizedDescription)")
        }
    }
}

extension RegistrationViewModel {
    enum ViewModelLocalizedError: LocalizedError {
        case failedToGetPositions(Error)
    }
}
