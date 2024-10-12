//
//  MainTabBarView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import SwiftUI

struct MainTabBarView: View {
    @Binding var selectedTab: TabbedItems
    var body: some View {
        ZStack(alignment: .bottom) {
            
            HStack {
                ForEach(TabbedItems.allCases, id: \.self) { item in
                    Spacer()
                    
                    Button {
                        selectedTab = item
                    } label: {
                        TabBarItemView(
                            imageName: item.image,
                            text: item.tile,
                            isActive: selectedTab == item
                        )
                    }
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color(uiColor: UIColor.secondarySystemBackground))
        }
    }
}

#Preview {
    @Previewable @State var selectedTab: TabbedItems = .userList
    MainTabBarView(selectedTab: $selectedTab)
}
