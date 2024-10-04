//
//  ApiManager.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 60
        self.urlSession = URLSession(
            configuration: configuration,
            delegate: MonitorInternetConnection(),
            delegateQueue: .main
        )
    }
    
    func initRequest(with url: URL) async throws -> Data {
        let (data, response) = try await urlSession.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw NetworkError.invalidServerResponse }
        return data
    }
}
