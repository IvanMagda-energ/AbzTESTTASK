//
//  MultipartRequest.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 25.10.2024.
//

import Foundation

public struct MultipartRequest {
    public let boundary: String
    private let lineBreak = "\r\n"
    private var data: Data
    
    /// Initializes a new `MultipartRequest` with a boundary for separating multipart sections.
    /// - Parameter boundary: The boundary `String` object to separate parts in the form data. Defaults to a unique UUID-based string.
    public init(boundary: String = "Boundary" + UUID().uuidString) {
        self.boundary = boundary
        self.data = .init()
    }
    
    /// Appends a boundary marker to the multipart data.
    private mutating func appendBoundary() {
        data.append("--\(boundary)\(lineBreak)")
    }
    
    /// Appends a line break to the multipart data.
    private mutating func appendLineBreak() {
        data.append(lineBreak)
    }
    
    /// Generates the `Content-Disposition` header for a form field.
    /// - Parameter key: The form field's name.
    /// - Returns: A `Content-Disposition` header string for the specified field.
    private func disposition(_ key: String) -> String {
        "Content-Disposition: form-data; name=\"\(key)\""
    }
    
    /// Adds a text field to the multipart request.
    /// - Parameters:
    ///   - key: The form field's name as `String`.
    ///   - value: The text value to associate with the form field as `String`.
    public mutating func add(
        key: String,
        value: String
    ) {
        appendBoundary()
        data.append(disposition(key) + lineBreak)
        appendLineBreak()
        data.append(value + lineBreak)
    }
    
    /// Adds a file to the multipart request.
    /// - Parameters:
    ///   - key: The form field's name as `String`.
    ///   - fileName: The name of the file as `String`.
    ///   - fileMimeType: The MIME type of the file (e.g., "image/jpeg") as `String`.
    ///   - fileData: The file's binary data as `Data`.
    public mutating func add(
        key: String,
        fileName: String,
        fileMimeType: String,
        fileData: Data
    ) {
        appendBoundary()
        data.append(disposition(key) + "; filename=\"\(fileName)\"" + lineBreak)
        data.append("Content-Type: \(fileMimeType)" + lineBreak + lineBreak)
        data.append(fileData)
        appendLineBreak()
    }
    
    /// The HTTP `Content-Type` header value for the multipart request.
    public var httpContentTypeHeadeValue: String {
        "multipart/form-data; boundary=\(boundary)"
    }
    
    /// The complete HTTP body data for the multipart request, including closing boundary.
    public var httpBody: Data {
        var bodyData = data
        bodyData.append("--\(boundary)--")
        return bodyData
    }
}
