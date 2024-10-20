//
//  Untitled.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import SwiftUI

enum TextFieldState {
    case initial
    case focused
    case emptyFieldError
    case incorrectValueError
    
    public var fieldColor: Color {
        switch self {
        case .initial:
            Color.secondary
        case .focused:
            Color.appSecondary
        case .emptyFieldError, .incorrectValueError:
            Color.red
        }
    }
}
