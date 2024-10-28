//
//  UsersListViewModel.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import Foundation
import os

@Observable
final class UsersViewModel {
    private let logger = Logger(
        subsystem: String(describing: Bundle.main.bundleIdentifier),
        category: String(describing: UsersViewModel.self)
    )
    
    private(set) var users = [User]().sorted()
    private var page = 1
    private var isAllPagesLoaded = false
    
    var error: ViewModelLocalizedError?
    var hasError = false
    private(set) var isLoading = false
    
    private let requestManager: RequestManagerProtocol
        
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
    
    /// Asynchronously fetches a paginated list of users and updates the view model.
    ///
    /// This method sends a request to retrieve users for the current page. It appends the fetched users to the existing
    /// list and increments the page number if there are more pages available. If all pages are loaded or if another
    /// request is already in progress, the function will return early without initiating a new request.
    @MainActor
    func getUsers() async {
        guard !isLoading  else {
            logger.info("\(#function) Request blocked: already loading users.")
            return
        }
        
        guard !isAllPagesLoaded else {
            logger.info("\(#function) Request blocked: all pages are already loaded.")
            return
        }
        
        defer {
            isLoading = false
            logger.info("\(#function) Request for users completed.")
        }
        
        logger.info("\(#function) Starting request for users, page \(self.page).")
        do {
            isLoading = true
            
            // Since the request executes very quickly, to demonstrate the UI behaviour,
            // We are adding a small delay of 1 second.
            try await Task.sleep(for: .seconds(1))
            
            let request = UsersRequests.getUsers(page: page, count: 6)
            let result: UsersResponse = try await requestManager.initRequest(with: request)
            users.append(contentsOf: result.users)
            
            if page < result.totalPages {
                page += 1
            } else {
                isAllPagesLoaded = true
                logger.info("\(#function) All pages loaded. Total pages: \(result.totalPages).")
            }
        } catch {
            // If the user cannot influence the occurrence of the error and cannot fix it,
            // They do not need to know what kind of error has occurred. For debugging, we log the error.
            switch error as? NetworkError {
            case .notFound(let error):
                self.logger.error("\(#function) \(error.message)")
            case .validationFailed(let error):
                self.logger.error("\(#function) \(error.message) \(String(describing: error.fails?.count?.first)) \(String(describing: error.fails?.page?.first))")
            default:
                break
            }
            
            self.error = .failedToGetUsers(error)
            self.hasError = true
            logger.error("Failed to get users: \(error.localizedDescription)")
        }
    }
}
