//
//  GalleryPickerView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import PhotosUI
import SwiftUI
import os

struct GalleryPickerView: UIViewControllerRepresentable {
    private let logger = Logger(
        subsystem: String(describing: Bundle.main.bundleIdentifier),
        category: String(describing: GalleryPickerView.self))
    
    @Binding var imageData: Data?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: GalleryPickerView
        
        init(_ parent: GalleryPickerView) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else {
                parent.logger.error("Failed to capture photo from gallery, PHPPickerResult is empty")
                return
            }
            
            guard provider.canLoadObject(ofClass: UIImage.self) else {
                parent.logger.error("Failed to capture photo from gallery, provider cannot load image")
                return
            }
            
            provider.loadObject(ofClass: UIImage.self) { image, _ in
                guard let image = image as? UIImage else {
                    self.parent.logger.error("Failed to capture photo from gallery, failed cast loaded object to image")
                    return
                }
                
                guard let data = image.convertToData() else {
                    self.parent.logger.error("Failed to capture photo from gallery, failed compressing and converting image to data")
                    return
                }
                
                // Convert captured image from gallery to data with default compressing quality
                self.parent.imageData = data
                self.parent.logger.info("Successful captured image from photo gallery")
            }
        }
    }
}
