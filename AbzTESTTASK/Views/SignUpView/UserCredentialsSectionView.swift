//
//  UserCredentialsSectionView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import SwiftUI

struct UserCredentialsSectionView: View {
    @FocusState var focusedField: FocusedField?
    @Binding var username: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var isEmailCorrect: Bool
    @Binding var isPhoneCorrect: Bool
    
    var body: some View {
        VStack {
            NameTextField(
                name: $username,
                focusedField: _focusedField
            )
                        
            EmailTextField(
                email: $email,
                isEmailCorrect: $isEmailCorrect,
                focusedField: _focusedField
            )
            
            PhoneTextField(
                phone: $phone, isPhoneCorrect: $isPhoneCorrect,
                focusedField: _focusedField
            )
        }
    }
}

#Preview {
    UserCredentialsSectionView(
        username: .constant(""),
        email: .constant(""),
        phone: .constant(""),
        isEmailCorrect: .constant(true),
        isPhoneCorrect: .constant(true)
    )
}
