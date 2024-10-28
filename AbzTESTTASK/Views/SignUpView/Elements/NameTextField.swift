//
//  NameTextField.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 15.10.2024.
//

import SwiftUI

struct NameTextField: View {
    @Binding var name: String
    @FocusState var focusedField: FocusedField?
    
    @State private var fieldState: FieldState = .initial
    @State private var isEdited = false
    
    private let textFieldHeight: CGFloat = 56
    private let footerTextHeight: CGFloat = 16
    private let cornerRadius: CGFloat = 4
    private let borderWidth: CGFloat = 2
    private let spacing: CGFloat = 2
    private let fieldSpacing: CGFloat = 4
    private let lineLimit = 1
    private var placeholder: Text {
        Text(LocalizedKeys.placeholder)
            .foregroundStyle(fieldState.fieldColor)
    }
            
    var body: some View {
        VStack(spacing: spacing) {
            VStack(spacing: fieldSpacing) {
                if !name.isEmpty {
                    Text(LocalizedKeys.placeholder)
                        .font(.footnote)
                        .foregroundStyle(fieldState.fieldColor)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("", text: $name, prompt: placeholder)
                    .focused($focusedField, equals: .name)
                    .padding(.horizontal)
                    .lineLimit(lineLimit)
                    .onSubmit {
                        focusedField = .email
                    }
            }
            .frame(height: textFieldHeight)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(fieldState.fieldColor, lineWidth: borderWidth)
                    .foregroundStyle(Color.clear)
            }
            .onChange(of: focusedField) { _, _ in
                checkFieldState()
            }
            HStack {
                if fieldState == .emptyFieldError {
                    Text(LocalizedKeys.required)
                        .foregroundStyle(fieldState.fieldColor)
                        .font(.footnote)
                        .padding(.horizontal)
                }
            }
            .frame(height: footerTextHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .animation(.default, value: fieldState)
        .animation(.default, value: name)
    }
    
    /// Updates the current `fieldState` based on the focused field and its content.
    private func checkFieldState() {
        switch focusedField {
        case .name:
            fieldState = .focused
            isEdited = true
        default:
            guard isEdited else {
                return
            }
            if name.isEmpty {
                fieldState = .emptyFieldError
            } else {
                fieldState = .initial
            }
        }
    }
}

#Preview {
    @Previewable @State var name = ""
    NameTextField(name: $name)
    NameTextField(name: .constant("test@mail.com"))
}

extension NameTextField {
    enum LocalizedKeys {
        static let placeholder: LocalizedStringKey = "name.textfield.placeholder"
        static let required: LocalizedStringKey = "required.field"
    }
}
