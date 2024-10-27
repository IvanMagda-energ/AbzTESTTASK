//
//  CheckToggleStyle.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 16.10.2024.
//

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
                    .padding()
            } icon: {
                Image(systemName: configuration.isOn ? "record.circle.fill" : "circle")
                    .foregroundStyle(configuration.isOn ? Color.appSecondary : .secondary)
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    @Previewable @State var isOn = false
    Toggle("Switch Me", isOn: $isOn)
        .toggleStyle(CheckToggleStyle())
}
