//
//  PrimaryFilledButtonStyle.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 04.10.2024.
//

import SwiftUI

struct PrimaryFilledButtonStyle: ButtonStyle {
    let isDisabled: Bool
    private let width: CGFloat = 140
    private let height: CGFloat = 48
    
    func makeBody(configuration: Configuration) -> some View {
        var backgroundColor: Color {
            if isDisabled {
                .buttonDisabled
            } else {
                configuration.isPressed ? .buttonPressed : .appPrimary
            }
        }
        
        var foregroundColor: Color {
            if isDisabled {
                .secondary
            } else {
                .primary
            }
        }
        
        configuration.label
            .frame(width: width, height: height)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .clipShape(.capsule)
    }
}

#Preview {
    Button("try.again.button") {}
        .buttonStyle(PrimaryFilledButtonStyle(isDisabled: false))
    
    Button("try.again.button") {}
        .buttonStyle(PrimaryFilledButtonStyle(isDisabled: true))
}
