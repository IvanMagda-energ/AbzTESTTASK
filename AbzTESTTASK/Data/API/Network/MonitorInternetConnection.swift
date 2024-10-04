//
//  Untitled.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 04.10.2024.
//

import Foundation
import SwiftUI

@Observable
class MonitorInternetConnection: NSObject, URLSessionDelegate{
    var isOffline = false
    
    func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
        // Indicate network status, e.g., offline mode
        Task { @MainActor in
            isOffline = true
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, willBeginDelayedRequest: URLRequest, completionHandler: (URLSession.DelayedRequestDisposition, URLRequest?) -> Void) {
        // Indicate network status, e.g., back to online
        Task { @MainActor in
            isOffline = false
        }
    }
}

