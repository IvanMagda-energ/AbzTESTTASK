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
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
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
            
            VStack(spacing: 4) {
                Text(user.name)
                    .font(.system(size: 20))
                    .lineLimit(3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(user.position)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(user.email)
                    .font(.system(size: 14))
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 4)
                
                Text(user.phone)
                    .font(.system(size: 14))
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    UserListRowView(
        user: User(
            id: 1,
            name: "Angel",
            email: "angel.williams@example.com",
            phone: "+380496540023",
            position: "Designer",
            positionId: 4,
            registrationTimestamp: 1537777441,
            photo: "https://frontend-test-assignment-api.abz.agency/images/users/5b977ba13fb3330.jpeg"
        )
    )
}
