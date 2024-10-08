//
//  Untitled.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 04.10.2024.
//

import SwiftUI
import Network

@Observable
class NetworkConnectionMonitor {
    static let shared = NetworkConnectionMonitor()
    
    private var monitor: NWPathMonitor?
    
    var isOffline = false
    
    func checkConnection() {
        startMonitoring()
        monitor?.pathUpdateHandler = { path in
            
            switch path.status {
            case .satisfied:
                Task { @MainActor in
                    self.isOffline = false
                    self.stopMonitoring()
                }
            default:
                Task { @MainActor in
                    self.isOffline = true
                    self.stopMonitoring()
                }
            }
        }
    }
    
    private func startMonitoring() {
        self.monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor?.start(queue: queue)
    }
    
    private func stopMonitoring() {
        monitor?.cancel()
        monitor = nil
    }
}

