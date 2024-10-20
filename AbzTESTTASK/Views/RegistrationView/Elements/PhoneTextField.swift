//
//  PhoneTextField.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 15.10.2024.
//

import SwiftUI

struct PhoneTextField: View {
    @Binding var phone: String
    @Binding var isPhoneCorrect: Bool
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
                if !phone.isEmpty {
                    Text(LocalizedKeys.placeholder)
                        .font(.footnote)
                        .lineLimit(1)
                        .foregroundStyle(fieldState.fieldColor)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                TextField("", text: $phone, prompt: placeholder)
                    .focused($focusedField, equals: .phone)
                    .padding(.horizontal)
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
            .onChange(of: phone) {
                isPhoneCorrect = phone.wholeMatch(of: Constants.phoneRegex) != nil
            }
            
            HStack {
                switch fieldState {
                case .emptyFieldError:
                    Text(LocalizedKeys.required)
                case .incorrectValueError:
                    Text(LocalizedKeys.invalidPhone)
                case .initial:
                    Text(LocalizedKeys.phoneFormatExample)
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
        .animation(.default, value: phone)
    }
    
    private var placeholder: Text {
        Text(LocalizedKeys.placeholder)
            .foregroundStyle(fieldState.fieldColor)
    }
    
    private func checkFieldState() {
        switch focusedField {
        case .phone:
            fieldState = .focused
            isEdited = true
        default:
            guard isEdited else {
                return
            }
            if phone.isEmpty {
                fieldState = .emptyFieldError
            } else if !isPhoneCorrect {
                fieldState = .incorrectValueError
            } else {
                fieldState = .initial
            }
        }
    }
}

#Preview {
    PhoneTextField(phone: .constant(""), isPhoneCorrect: .constant(true))
    PhoneTextField(phone: .constant("+380681111111"), isPhoneCorrect: .constant(true))
}

extension PhoneTextField {
    enum LocalizedKeys {
        static let placeholder: LocalizedStringKey = "phone.textfield.placeholder"
        static let required: LocalizedStringKey = "required.field"
        static let invalidPhone: LocalizedStringKey = "invalid.phone.format"
        static let phoneFormatExample: String = "+38 (XXX) XXX - XX - XX"
    }
}

