//
//  NoUsersView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import SwiftUI

struct NoUsersView: View {
    private let imageSize: CGFloat = 200
    private let textSize: CGFloat = 20
    private let spacing: CGFloat = 24
    
    var body: some View {
        VStack(spacing: spacing) {
            Image("NoUsersImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
            
            Text(LocalizedKeys.noUsersText)
                .multilineTextAlignment(.center)
                .font(.system(size: textSize))
        }
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    NoUsersView()
}

extension NoUsersView {
    enum LocalizedKeys {
        static let noUsersText: LocalizedStringKey = "no.user.view.text"
    }
}
