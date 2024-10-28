//
//  Untitled.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import SwiftUI

/// An enum representing the various states of a form field.
enum FieldState {
    /// The field is in its default, unmodified state.
    case initial
    /// The field is currently focused by the user.
    case focused
    /// The field is required but has been left empty, triggering an error.
    case emptyFieldError
    /// The field contains an incorrect or invalid value.
    case incorrectValueError
    
    /// Property that returns a specific `Color` based on the field's state.
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
