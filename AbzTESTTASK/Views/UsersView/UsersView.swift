//
//  UsersView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI

struct UsersView: View {
    @State var viewModel = UsersViewModel()
    
    var body: some View {
        VStack (spacing: 0) {
            HeaderTextView(text: LocalizedKeys.headerText)
            
            if viewModel.users.isEmpty {
                ZStack {
                    NoUsersView()
                    Color.black.opacity(0.3)
                    ProgressView()
                }
            } else {
                UsersListView(viewModel: viewModel)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .alert(
            isPresented: $viewModel.hasError,
            error: viewModel.error
        ) { error in
            if let recoverySuggestion = error.recoverySuggestion {
                Button(recoverySuggestion, role: .cancel) {}
            } else {
                Button(LocalizedKeys.okButton, role: .cancel) {}
            }
        } message: { error in
            if let failureReason = error.failureReason {
                Text(failureReason + "\n" + (error.helpAnchor ?? ""))
            } else {
                Text(LocalizedKeys.unknownError, comment: "Unknown error")
            }
        }
        .task {
            await viewModel.getUsers()
        }
    }
}

#Preview {
    UsersView()
}

extension UsersView {
    enum LocalizedKeys {
        static let headerText: LocalizedStringKey = "user.list.view.header.text"
        static let okButton: LocalizedStringKey = "ok.button"
        static let unknownError: LocalizedStringKey = "unknown.error"
    }
}


