//
//  SignUpResultView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 27.10.2024.
//

import SwiftUI

struct SignUpResultView: View {
    @Environment(\.dismiss) var dismiss
    let signUpResult: SignUpResult
    
    private let imageMaxSize: CGFloat = 200
    private let spacing: CGFloat = 24
    private let fontSize: CGFloat = 20
    
    var body: some View {
        VStack(spacing: spacing) {
            switch signUpResult {
            case .success:
                Image("SuccessImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: imageMaxSize, maxHeight: imageMaxSize)
                
                Text(LocalizedKeys.successfulSignUp)
                    .multilineTextAlignment(.center)
                    .font(.system(size: fontSize))
                
                Button(LocalizedKeys.gotIt) {
                    dismiss()
                }
                .buttonStyle(PrimaryFilledButtonStyle(isDisabled: false))
                
            case .failure:
                Image("FailureImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: imageMaxSize, maxHeight: imageMaxSize)
                
                Text(LocalizedKeys.credentialAlreadyRegistered)
                    .multilineTextAlignment(.center)
                    .font(.system(size: fontSize))
                
                Button(LocalizedKeys.tryAgain) {
                    dismiss()
                }
                .buttonStyle(PrimaryFilledButtonStyle(isDisabled: false))
            }
        }
    }
}

#Preview {
    SignUpResultView(signUpResult: .success)
}

extension SignUpResultView {
    enum LocalizedKeys {
        static let successfulSignUp: LocalizedStringKey = "successful.signUp.view.text"
        static let gotIt: LocalizedStringKey = "got.it.button"
        static let tryAgain: LocalizedStringKey = "try.again.button"
        static let credentialAlreadyRegistered: LocalizedStringKey = "credential.already.registered.view.text"
    }
}
