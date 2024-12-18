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
    let onDismiss: () -> Void
    
    private let imageMaxSize: CGFloat = 200
    private let spacing: CGFloat = 24
    private let fontSize: CGFloat = 20
    private let closeButtonPadding: CGFloat = 24
    
    var body: some View {
        ZStack(alignment: .topTrailing) {

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
                        onDismiss()
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.secondary)
            }
            .padding(closeButtonPadding)
        }
    }
}

#Preview {
    Color.clear
        .sheet(isPresented: .constant(true)) {
            SignUpResultView(signUpResult: .success) {}
        }
}

extension SignUpResultView {
    enum LocalizedKeys {
        static let successfulSignUp: LocalizedStringKey = "successful.signUp.view.text"
        static let gotIt: LocalizedStringKey = "got.it.button"
        static let tryAgain: LocalizedStringKey = "try.again.button"
        static let credentialAlreadyRegistered: LocalizedStringKey = "credential.already.registered.view.text"
    }
}
