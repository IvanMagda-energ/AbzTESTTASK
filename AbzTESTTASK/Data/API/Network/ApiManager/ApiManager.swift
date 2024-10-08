//
//  ApiManager.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    private let connectionMonitor: NetworkConnectionMonitor
    
    init(urlSession: URLSession = URLSession.shared,
         connectionMonitor: NetworkConnectionMonitor = NetworkConnectionMonitor.shared) {
        self.urlSession = urlSession
        self.connectionMonitor = connectionMonitor
    }
    
    func initRequest(with data: RequestProtocol, authToken: String = "") async throws -> Data {
        connectionMonitor.checkConnection()
        let (data, response) = try await urlSession.data(for: data.request(authToken: authToken))
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw NetworkError.invalidServerResponse }
        return data
    }
}
