//
//  ContentView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 01.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var connectionMonitor = MonitorInternetConnection()
    
    var body: some View {
        Color.clear
            .fullScreenCover(isPresented: $connectionMonitor.isOffline) {
                NoConnectionView()
            }
    }
}

#Preview {
    ContentView()
}
