//
//  TabBarItemView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import SwiftUI

struct TabBarItemView: View {
    let imageName: String
    let text: LocalizedStringKey
    let isActive: Bool
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            Text(text)
        }
        .foregroundStyle(isActive ? Color.appSecondary : Color.secondary)
    }
}

#Preview {
    let userListTabbedItem = TabbedItems.userList
    TabBarItemView(
        imageName: userListTabbedItem.image,
        text: userListTabbedItem.tile,
        isActive: true
    )
    
    let authorisationTabbedItem = TabbedItems.authorisation
    TabBarItemView(
        imageName: authorisationTabbedItem.image,
        text: authorisationTabbedItem.tile,
        isActive: false
    )
}
