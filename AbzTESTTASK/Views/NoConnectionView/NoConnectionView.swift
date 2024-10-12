//
//  NoConnectionView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 04.10.2024.
//

import SwiftUI

struct NoConnectionView: View {
    @Environment(\.dismiss) var dismiss
    
    private let imageMaxSize: CGFloat = 200
    private let spacing: CGFloat = 24
    private let fontSize: CGFloat = 20
    
    var body: some View {
        VStack(spacing: spacing) {
            Image("NoConnectionImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: imageMaxSize, maxHeight: imageMaxSize)
            
            Text(LocalizedKeys.noConnectionText)
                .multilineTextAlignment(.center)
                .font(.system(size: fontSize))
            
            Button(LocalizedKeys.tryAgain) {
                dismiss()
            }
            .buttonStyle(PrimaryFilledButtonStyle(isDisabled: false))
        }
    }
}

#Preview {
    NoConnectionView()
}

extension NoConnectionView {
    enum LocalizedKeys {
        static let noConnectionText: LocalizedStringKey = "no.connection.view.text"
        static let tryAgain: LocalizedStringKey = "try.again.button"
    }
}
