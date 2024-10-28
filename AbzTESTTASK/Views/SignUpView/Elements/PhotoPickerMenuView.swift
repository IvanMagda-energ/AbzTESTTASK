//
//  PhotoPickerMenuView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import SwiftUI

struct PhotoPickerMenuView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var sourceType: SourceType
    
    private let imageSize: CGFloat = 56
    
    var body: some View {
        VStack {
            Text(LocalizedKeys.pickerMenuTitle)
                .padding()
            HStack {
                // MARK: - Camera picker
                Button {
                    sourceType = .camera
                    self.dismiss()
                } label: {
                    VStack {
                        Image("CameraImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize, height: imageSize)
                            .padding()
                        
                        Text(LocalizedKeys.cameraButton)
                            .foregroundStyle(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                
                // MARK: - Gallery picker
                Button {
                    sourceType = .photoLibrary
                    self.dismiss()
                } label: {
                    VStack {
                        Image("GaleryImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize, height: imageSize)
                            .padding()
                        
                        Text(LocalizedKeys.galleryButton)
                            .foregroundStyle(.black)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    Color.black
        .sheet(isPresented: .constant(true)) {
            PhotoPickerMenuView(sourceType: .constant(.photoLibrary))
                .presentationDetents([.height(228)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(28)
        }
}

extension PhotoPickerMenuView {
    private enum LocalizedKeys {
        static var cameraButton: LocalizedStringKey = "camera.picker.button"
        static var galleryButton: LocalizedStringKey = "gallery.picker.button"
        static var pickerMenuTitle: LocalizedStringKey = "picker.menu.title"
    }
}
