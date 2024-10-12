//
//  HeaderTextView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import SwiftUI

struct HeaderTextView: View {
    let text: LocalizedStringKey
    private let headerTextSize: CGFloat = 20
    private let headerHeight: CGFloat = 56
    
    var body: some View {
        ZStack {
            Color.appPrimary
            Text(text)
                .multilineTextAlignment(.center)
                .font(.system(size: headerTextSize))
        }
        .frame(maxWidth: .infinity, maxHeight: headerHeight)
    }
}

#Preview {
    HeaderTextView(text: "authorisation.view.header.text")
}
