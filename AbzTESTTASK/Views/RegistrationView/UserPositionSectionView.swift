//
//  UserPositionSectionView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 20.10.2024.
//

import SwiftUI

struct UserPositionSectionView: View {
    let positions: [Position]
    
    @Binding var selectedPosition: Position?
    
    private let titleSize: CGFloat = 18
    
    var body: some View {
        VStack {
            Text(LocalizedKeys.positionSectionTitle)
                .font(.system(size: titleSize))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(positions) { position in
                PositionToggleView(
                    position: position,
                    selectedPosition: $selectedPosition
                )
                .onAppear {
                    // Set initial state for positions as first item in positions array
                    selectedPosition = positions.first
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedPosition: Position?
    UserPositionSectionView(
        positions: MockUserData.positions,
        selectedPosition: $selectedPosition
    )
}

extension UserPositionSectionView {
    enum LocalizedKeys {
        static let positionSectionTitle: LocalizedStringKey = "position.section.title"
    }
}
