//
//  UserListRowView.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 09.10.2024.
//

import SwiftUI

struct UserListRowView: View {
    let user: User
    
    private let imageSize: CGFloat = 50
    private let nameFontSize: CGFloat = 20
    private let fontSize: CGFloat = 14
    private let hStackSpacing: CGFloat = 16
    private let vStackSpacing: CGFloat = 4
    private let nameLineLimit = 3
    private let lineLimit = 1
    private let topPadding: CGFloat = 4
    
    var body: some View {
        HStack(alignment: .top, spacing: hStackSpacing) {
            AsyncImage(url: URL(string: user.photo)) { result in
                switch result {
                case .failure:
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                default:
                    ProgressView()
                }
            }
            .frame(width: imageSize, height: imageSize)
            .clipShape(.circle)
            
            VStack(spacing: vStackSpacing) {
                Text(user.name)
                    .font(.system(size: nameFontSize))
                    .lineLimit(nameLineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(user.position)
                    .font(.system(size: fontSize))
                    .foregroundStyle(.secondary)
                    .lineLimit(lineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(user.email)
                    .font(.system(size: fontSize))
                    .lineLimit(lineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, topPadding)
                
                Text(user.phone)
                    .font(.system(size: fontSize))
                    .lineLimit(lineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    UserListRowView(user: MockUserData.userOne)
}
