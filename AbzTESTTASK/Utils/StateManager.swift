//
//  StateManager.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 28.10.2024.
//

import SwiftUI

@MainActor
@Observable
final class StateManager {
    static let shared = StateManager()
    nonisolated private init() {}
    
    var isShowNoConnectionView = false
}
