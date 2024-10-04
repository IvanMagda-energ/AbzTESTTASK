//
//  ReguestManager.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

class RequestManager: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    
    init(
        apiManager: APIManagerProtocol = APIManager()
    ) {
        self.apiManager = apiManager
    }
    
    func initRequest<T: Decodable>(with urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }
        let data = try await apiManager.initRequest(with: url)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
    
    func getData(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }
        let data = try await apiManager.initRequest(with: url)
        return data
    }
}
