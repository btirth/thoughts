//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Tirth on 11/27/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showPhotoSelector = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            
//            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthencateUser, label: {})
            
            AuthHeaderView(title1: "Get Started.", title2: "Create your account")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullname)
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button {
                
                showPhotoSelector = viewModel.register(withEmail: email, password: password, fullname: fullname, username: username) 
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

            Spacer()

            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
            .sheet(isPresented: $showPhotoSelector) {
                ProfilePhotoSelectorView()
            }
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
