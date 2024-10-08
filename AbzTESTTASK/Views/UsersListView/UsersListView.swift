//
//  UsersListView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI

struct UsersListView: View {
    var body: some View {
        VStack (spacing: 0) {
            HeaderTextView(text: LocalizedKeys.headerText)
            
            Spacer()
        }
    }
}

#Preview {
    UsersListView()
}

extension UsersListView {
    enum LocalizedKeys {
        static let headerText: LocalizedStringKey = "user.list.view.header.text"
    }
}


