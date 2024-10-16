//
//  RegistrationView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI

struct RegistrationView: View {
    @FocusState var focusedField: FocusedField?
    @State var username = ""
    @State var email = ""
    @State private var phone = ""
    @State private var isEmailCorrect = false
    @State private var isPhoneCorrect = false
    
    private let spacing: CGFloat = 16
    
    var body: some View {
        VStack (spacing: spacing) {
            HeaderTextView(text: LocalizedKeys.headerText)
            
            NameTextField(
                name: $username,
                focusedField: _focusedField
            )
            .padding(.horizontal)
            .padding(.top)
            
            EmailTextField(
                email: $email,
                isEmailCorrect: $isEmailCorrect,
                focusedField: _focusedField
            )
            .padding(.horizontal)
            
            PhoneTextField(
                phone: $phone, isPhoneCorrect: $isPhoneCorrect,
                focusedField: _focusedField
            )
            .padding(.horizontal)
            
            Button(LocalizedKeys.signUpButton) {}
            .buttonStyle(PrimaryFilledButtonStyle(isDisabled: false))
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
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
