//
//  UsersListView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import SwiftUI

struct UsersListView: View {
    @Bindable var viewModel: UsersViewModel
    var body: some View {
        List(viewModel.users) { user in
            UserListRowView(user: user)
        }
        .listStyle(.plain)
    }
}

#Preview {
    @Previewable @State var viewModel = UsersViewModel()
    UsersListView(viewModel: viewModel)
        .task {
            await viewModel.getUsers()
        }
}
