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
        List {
            ForEach(viewModel.users) { user in
                let isLastUser = user.id == viewModel.users.last?.id
                UserListRowView(user: user)
                    .padding(isLastUser ? .top : .vertical)
                    .onAppear {
                        if isLastUser {
                            Task {
                                await viewModel.getUsers()
                            }
                        }
                    }
                    .listRowSeparator(isLastUser ? .hidden : .visible)
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .scaleEffect(2)
                    .padding()
                    .id(UUID())
            }
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
