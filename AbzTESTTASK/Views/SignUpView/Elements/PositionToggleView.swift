//
//  PositionToggleView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import SwiftUI

struct PositionToggleView: View {
    let position: Position
    @State private var isOn = false
    @Binding var selectedPosition: Position?
    var body: some View {
        HStack {
            Toggle(position.name, isOn: $isOn)
                .toggleStyle(CheckToggleStyle())
                .onChange(of: isOn) {
                    if isOn {
                        selectedPosition = position
                    }
                }
                .onChange(of: selectedPosition) { _, newValue in
                    guard newValue == position else {
                        isOn = false
                        return
                    }
                    isOn = true
                }
            Spacer()
        }
    }
}

#Preview {
    let position = MockUserData.positionOne
    PositionToggleView(
        position: MockUserData.positionOne,
        selectedPosition: .constant(position)
    )
}
