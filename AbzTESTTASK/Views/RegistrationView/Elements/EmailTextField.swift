//
//  EmailTextField.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 15.10.2024.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    @Binding var isEmailCorrect: Bool
    @FocusState var focusedField: FocusedField?
    
    @State private var fieldState: FieldState = .initial
    @State private var isEdited = false
    
    private let footerTextHeight: CGFloat = 16
    private let textFieldHeight: CGFloat = 56
    private let cornerRadius: CGFloat = 4
    private let borderWidth: CGFloat = 2
            
    var body: some View {
        VStack(spacing: 2) {
            VStack(spacing: 4) {
                if !email.isEmpty {
                    Text(LocalizedKeys.placeholder)
                        .font(.footnote)
                        .lineLimit(1)
                        .foregroundStyle(fieldState.fieldColor)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("", text: $email, prompt: placeholder)
                    .focused($focusedField, equals: .email)
                    .padding(.horizontal)
                    .onSubmit {
                        focusedField = .phone
                    }
            }
            .frame(height: textFieldHeight)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(fieldState.fieldColor, lineWidth: borderWidth)
                    .foregroundStyle(Color.clear)
            }
            .onChange(of: focusedField) {
                checkFieldState()
            }
            .onChange(of: email) {
                self.isEmailCorrect = email.wholeMatch(of: Constants.emailRegex) != nil
            }
            
            HStack {
                switch fieldState {
                case .emptyFieldError:
                    Text(LocalizedKeys.required)
                case .incorrectValueError:
                    Text(LocalizedKeys.invalidEmail)
                default:
                    EmptyView()
                }
            }
            .foregroundStyle(fieldState.fieldColor)
            .font(.footnote)
            .padding(.horizontal)
            .frame(height: footerTextHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .animation(.default, value: fieldState)
        .animation(.default, value: email)
    }
    
    private var placeholder: Text {
        Text(LocalizedKeys.placeholder)
            .foregroundStyle(fieldState.fieldColor)
    }
    
    private func checkFieldState() {
        switch focusedField {
        case .email:
            fieldState = .focused
            isEdited = true
        default:
            guard isEdited else {
                return
            }
            if email.isEmpty {
                fieldState = .emptyFieldError
            } else if !isEmailCorrect {
                fieldState = .incorrectValueError
            } else {
                fieldState = .initial
            }
        }
    }
}

#Preview {
    EmailTextField(email: .constant(""), isEmailCorrect: .constant(true))
    EmailTextField(email: .constant("test@Mail.com"), isEmailCorrect: .constant(true))
}

extension EmailTextField {
    enum LocalizedKeys {
        static let placeholder: LocalizedStringKey = "email.textfield.placeholder"
        static let required: LocalizedStringKey = "required.field"
        static let invalidEmail: LocalizedStringKey = "invalid.email.format"
    }
}
