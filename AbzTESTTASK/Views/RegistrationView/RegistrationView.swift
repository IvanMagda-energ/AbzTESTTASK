//
//  RegistrationView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var viewModel = RegistrationViewModel()
    @FocusState private var focusedField: FocusedField?
    @State private var username = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var isEmailCorrect = false
    @State private var isPhoneCorrect = false
    @State private var selectedPosition: Position?
    
    private let spacing: CGFloat = 16
    
    var body: some View {
        ScrollView {
            VStack (spacing: spacing) {
                HeaderTextView(text: LocalizedKeys.headerText)
                
                UserCredentialsSectionView(
                    focusedField: _focusedField,
                    username: $username,
                    email: $email,
                    phone: $phone,
                    isEmailCorrect: $isEmailCorrect,
                    isPhoneCorrect: $isPhoneCorrect
                )
                .padding(.top)
                .padding(.horizontal)
                
                UserPositionSectionView(
                    positions: viewModel.positions,
                    selectedPosition: $selectedPosition
                )
                .padding()
                
                UserPhotoSectionView()
                    .padding(.horizontal)
                
                Button(LocalizedKeys.signUpButton) {}
                    .buttonStyle(PrimaryFilledButtonStyle(isDisabled: false))
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .task {
                await viewModel.getPositions()
            }
        }
    }
}

#Preview {
    RegistrationView()
}

extension RegistrationView {
    enum LocalizedKeys {
        static let headerText: LocalizedStringKey = "authorisation.view.header.text"
        static let signUpButton: LocalizedStringKey = "signup.button"
    }
}
