//
//  ProcessInfo+Extensions.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 28.10.2024.
//

import Foundation

extension ProcessInfo {
    static func isOnPreview() -> Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
