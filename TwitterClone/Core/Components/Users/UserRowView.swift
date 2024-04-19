//
//  UserRowView.swift
//  TwitterClone
//
//  Created by Tirth on 11/26/22.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                
                Text("@\(user.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
        
    }
}
