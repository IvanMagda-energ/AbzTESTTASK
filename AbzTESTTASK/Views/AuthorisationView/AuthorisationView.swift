//
//  AuthorisationView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 07.10.2024.
//

import SwiftUI

struct AuthorisationView: View {
    
    
    var body: some View {
        VStack (spacing: 0) {
            HeaderTextView(text: LocalizedKeys.headerText)
            
            Spacer()
        }
    }
}

#Preview {
    AuthorisationView()
}

extension AuthorisationView {
    enum LocalizedKeys {
        static let headerText: LocalizedStringKey = "authorisation.view.header.text"
    }
}
