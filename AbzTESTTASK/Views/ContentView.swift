//
//  ContentView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 01.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var connectionMonitor = NetworkConnectionMonitor.shared
    @State var selectedTab: TabbedItems = .userList
    
    var body: some View {
        Group {
            switch selectedTab {
            case .userList:
                UsersListView()
            case .authorisation:
                AuthorisationView()
            }
            
            MainTabBarView(selectedTab: $selectedTab)
        }
        .fullScreenCover(isPresented: $connectionMonitor.isOffline) {
            NoConnectionView()
        }
    }
}

#Preview {
    ContentView()
}
