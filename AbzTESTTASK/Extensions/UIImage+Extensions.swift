//
//  UIImage+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 23.10.2024.
//

import SwiftUI

extension UIImage {
    
    /// Converts an image to `Data` by compressing it until it meets a specified maximum file size (in MB).
    ///
    /// This function gradually reduces the image's compression quality in steps until its data size fits within the given limit.
    /// If the image cannot be compressed to meet the specified file size, the function returns `nil`.
    ///
    /// - Parameter maxFileSizeMB: The maximum file size for the compressed image, in megabytes. Default is 5 MB.
    /// - Returns: A `Data` object containing the compressed image if it fits within the specified size limit, or `nil` if compression fails.
    func convertToData(with maxFileSizeMB: Int = 5) -> Data? {
        var compressingQuality: CGFloat = 1.0
        guard var imageData = self.jpegData(compressionQuality: compressingQuality) else {
            return nil
        }
        
        let maxFileSizeBytes = maxFileSizeMB * 1024 * 1024
        
        // If the initial data meets the file size requirement, return it immediately
        if imageData.count <= maxFileSizeBytes {
            return imageData
        }
        
        while imageData.count > maxFileSizeBytes && compressingQuality > 0.1 {
            compressingQuality -= 0.1
            guard let compressedData = self.jpegData(compressionQuality: compressingQuality) else {
                return nil
            }
            imageData = compressedData
        }
        
        return imageData.count <= maxFileSizeBytes ? imageData : nil
    }
}
