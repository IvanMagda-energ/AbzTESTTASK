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
    
    public init(boundary: String = "Boundary" + UUID().uuidString) {
        self.boundary = boundary
        self.data = .init()
    }
    
    private mutating func appendBoundary() {
        data.append("--\(boundary)\(lineBreak)")
    }
    
    private mutating func appendLineBreak() {
        data.append(lineBreak)
    }
    
    private func disposition(_ key: String) -> String {
        "Content-Disposition: form-data; name=\"\(key)\""
    }
    
    public mutating func add(
        key: String,
        value: String
    ) {
        appendBoundary()
        data.append(disposition(key) + lineBreak)
        appendLineBreak()
        data.append(value + lineBreak)
    }
    
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
    
    public var httpContentTypeHeadeValue: String {
        "multipart/form-data; boundary=\(boundary)"
    }
    
    public var httpBody: Data {
        var bodyData = data
        bodyData.append("--\(boundary)--")
        return bodyData
    }
}
