//
//  Untitled.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 04.10.2024.
//

import SwiftUI
import Network

/// A singleton class that monitors the network connection status.
///
/// This class uses the `NWPathMonitor` from the Network framework to observe changes in the network connection
/// status. It provides a way to check whether the device is online or offline and notifies about changes
/// in connectivity.
@Observable
class NetworkConnectionMonitor {
    static let shared = NetworkConnectionMonitor()
    
    private var monitor: NWPathMonitor?
    
    var isOffline = false
    
    /// Starts monitoring the network connection and updates the `isOffline` property.
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
    
    /// Initializes and starts the network path monitor.
    private func startMonitoring() {
        self.monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor?.start(queue: queue)
    }
    
    /// Stops monitoring the network connection and releases associated resources.
    private func stopMonitoring() {
        monitor?.cancel()
        monitor = nil
    }
}
