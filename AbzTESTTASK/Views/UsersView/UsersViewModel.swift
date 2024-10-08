//
//  UsersListViewModel.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import Foundation

@Observable
final class UsersViewModel {
    private let requestManager: RequestManagerProtocol
    var users = [User]()
    
    init(requestManager: RequestManagerProtocol = RequestManager()) {
        self.requestManager = requestManager
    }
    
    func getUsers() async {
        do {
            let request = UsersRequest.getUsers(page: 1, count: 6)
            let result: UserListResponse = try await requestManager.initRequest(with: request)
            users.append(contentsOf: result.users)
            
        } catch {
            NSLog("Failed to get users: \(error)")
        }
    }
}
