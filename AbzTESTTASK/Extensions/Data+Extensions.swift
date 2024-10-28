//
//  Data+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 25.10.2024.
//

import Foundation

extension Data {
    /// Appends a UTF-8 encoded string to the current data object.
    ///
    /// Converts the provided string to UTF-8 encoded `Data` and appends it to the existing data within the instance.
    /// This function is `mutating` because it modifies the instance's underlying data.
    ///
    /// - Parameter string: The `String` to be appended, which is converted to UTF-8 encoding before appending.
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
