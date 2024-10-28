//
//  UserPhotoSectionView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import SwiftUI
import PhotosUI

struct UserPhotoSectionView: View {
    private let fieldHeight: CGFloat = 56
    private let footerTextHeight: CGFloat = 16
    private let cornerRadius: CGFloat = 4
    private let borderWidth: CGFloat = 2
    private let imageSize: CGFloat = 150
    private let pickerPresentationHeight: CGFloat = 228
    private let pickerCornerRadius: CGFloat = 28
    
    @Binding var imageData: Data?
    
    @State private var fieldState: FieldState = .initial
    @State private var isShowPhotoPickerMenuView = false
    @State private var sourceType: SourceType = .none
    @State private var isShowCameraPicker = false
    @State private var isShowGalleryPicker = false
    @State private var selectedPickerItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            Group {
                if let imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                } else {
                    Image("UserPlaceholderImage")
                        .resizable()
                        .background(Color.appPrimary)
                    
                }
            }
            .frame(width: imageSize, height: imageSize)
            .clipShape(Circle())
            .padding()
            
            HStack {
                Text(LocalizedKeys.fieldPlaceholder)
                    .foregroundStyle(fieldState.fieldColor)
                
                Spacer()
                
                Button(LocalizedKeys.uploadButton) {
                    isShowPhotoPickerMenuView.toggle()
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
        .sheet(isPresented: $isShowPhotoPickerMenuView) {
            // OnDismiss
            switch sourceType {
            case .photoLibrary:
                isShowGalleryPicker.toggle()
            case .camera:
                isShowCameraPicker.toggle()
            case .none:
                return
            }
            
            // Reset to default state
            sourceType = .none
        } content: {
            PhotoPickerMenuView(sourceType: $sourceType)
                .presentationDetents([.height(pickerPresentationHeight)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(pickerCornerRadius)
        }
        .fullScreenCover(isPresented: $isShowCameraPicker) {
            // OnDismiss
            self.checkFieldState()
        } content: {
            CameraPickerView(photoData: $imageData)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $isShowGalleryPicker) {
            // OnDismiss
            self.checkFieldState()
        } content: {
            GalleryPickerView(imageData: $imageData)
        }
    }
    
    private func checkFieldState() {
        guard nil == imageData else {
            self.fieldState = .initial
            return
        }
        self.fieldState = .emptyFieldError
    }
}

#Preview {
    UserPhotoSectionView(imageData: .constant(nil))
}

extension UserPhotoSectionView {
    enum LocalizedKeys {
        static let fieldPlaceholder: LocalizedStringKey = "upload.user.image.placeholder"
        static let required: LocalizedStringKey = "required.image"
        static let uploadButton: LocalizedStringKey = "upload.button"
    }
}
