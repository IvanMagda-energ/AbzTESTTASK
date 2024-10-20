//
//  UserPhotoSectionView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import SwiftUI

struct UserPhotoSectionView: View {
    private let fieldHeight: CGFloat = 56
    private let footerTextHeight: CGFloat = 16
    private let cornerRadius: CGFloat = 4
    private let borderWidth: CGFloat = 2
    
    @State private var fieldState: TextFieldState = .initial
    @State private var isShowImagePicker = false
    
    var body: some View {
        VStack(spacing: 2) {
            
            HStack {
                Text(LocalizedKeys.fieldPlaceholder)
                    .foregroundStyle(fieldState.fieldColor)
                
                Spacer()
                
                Button(LocalizedKeys.uploadButton) {
                    isShowImagePicker.toggle()
                }
                .foregroundStyle(.appSecondary)
            }
            .padding()
            .frame(height: fieldHeight)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(fieldState.fieldColor, lineWidth: borderWidth)
                    .foregroundStyle(Color.clear)
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
    }
}

#Preview {
    UserPhotoSectionView()
}

extension UserPhotoSectionView {
    enum LocalizedKeys {
        static let fieldPlaceholder: LocalizedStringKey = "upload.user.image.placeholder"
        static let required: LocalizedStringKey = "required.image"
        static let uploadButton: LocalizedStringKey = "upload.button"
    }
}
