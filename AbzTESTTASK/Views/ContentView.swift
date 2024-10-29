//
//  ContentView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 01.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var stateManager = StateManager.shared
    @State var selectedTab: TabbedItems = .userList
    
    var body: some View {
        Group {
            switch selectedTab {
            case .userList:
                UsersView()
            case .authorisation:
                SignUpView()
            }
            
            MainTabBarView(selectedTab: $selectedTab)
        }
        .fullScreenCover(isPresented: $stateManager.isShowNoConnectionView) {
            NoConnectionView()
        }
    }
}

#Preview {
    ContentView()
}
