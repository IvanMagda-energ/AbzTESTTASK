//
//  SignUpView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var viewModel = SignUpViewModel()
    @FocusState private var focusedField: FocusedField?
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var isEmailCorrect = false
    @State private var isPhoneCorrect = false
    @State private var selectedPosition: Position?
    @State private var isShowPhotoPickerMenu = false
    @State private var imageData: Data?
    
    private var signUpButtonDisabled: Bool {
        name.isEmpty || email.isEmpty || phone.isEmpty || !isEmailCorrect || !isPhoneCorrect || selectedPosition == nil || imageData == nil
    }
    
    private let spacing: CGFloat = 16
    private let opacity: CGFloat = 0.3
    
    var body: some View {
        HeaderTextView(text: LocalizedKeys.headerText)
        
        ScrollView {
            VStack (spacing: spacing) {
                UserCredentialsSectionView(
                    focusedField: _focusedField,
                    username: $name,
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
                
                UserPhotoSectionView(imageData: $imageData)
                    .padding(.horizontal)
                
                Button(LocalizedKeys.signUpButton) {
                    // If any optional fields are empty, the sign-up button should be disabled.
                    // Therefore, a guard statement is used for unwrapping. In theory, the else block should not be executed.
                    guard let selectedPosition, let imageData else {
                        return
                    }
                    
                    Task {
                        await viewModel.signUp(
                            UserInfo(
                                name: name,
                                email: email.lowercased(),
                                phone: phone,
                                positionId: selectedPosition.id,
                                imageData: imageData
                            )
                        )
                    }
                }
                .buttonStyle(PrimaryFilledButtonStyle(isDisabled: signUpButtonDisabled))
                .disabled(signUpButtonDisabled)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .task { @MainActor in
                await viewModel.getPositions()
            }
        }
        .animation(.default, value: viewModel.isLoading)
        .scrollDismissesKeyboard(.interactively)
        .overlay {
            if viewModel.isLoading {
                ZStack {
                    Color.black.opacity(opacity)
                    ProgressView()
                }
                .ignoresSafeArea()
            }
        }
        .sheet(item: $viewModel.signUpResult) { result in
            SignUpResultView(signUpResult: result)
        }
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
    }
}

#Preview {
    SignUpView()
}

extension SignUpView {
    enum LocalizedKeys {
        static let headerText: LocalizedStringKey = "authorisation.view.header.text"
        static let signUpButton: LocalizedStringKey = "signup.button"
        static let okButton: LocalizedStringKey = "ok.button"
        static let unknownError: LocalizedStringKey = "unknown.error"
    }
}
