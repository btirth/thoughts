//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Tirth on 11/27/22.
//

import SwiftUI
import PhotosUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var image: [PhotosPickerItem] = []
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account", title2: "Add a  profile photo")
            
            PhotosPicker(selection: $image,
                         maxSelectionCount: 1,
                         matching: .images) {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
            }
            
//            Button {
//                showImagePicker = true
////                PhotosPicker(selection: $image,
////                             matching: .images) {
////                    if let profileImage = profileImage {
////                        profileImage
////                            .resizable()
////                            .modifier(ProfileImageModifier())
////                    } else {
////                        Image(systemName: "plus.circle")
////                            .resizable()
////                            .modifier(ProfileImageModifier())
////                    }
////                }
//            } label: {
//                if let profileImage = profileImage {
//                    profileImage
//                        .resizable()
//                        .modifier(ProfileImageModifier())
//                } else {
//                    Image(systemName: "plus.circle")
//                        .resizable()
//                        .modifier(ProfileImageModifier())
//                }
//
//            }
//            .sheet(isPresented: $showImagePicker,
//                   onDismiss: loadImage) {
//               // ImagePicker(selectedImage: image)
//                PhotosPicker(selection: $image,
//                             matching: .images) {
//                    if let profileImage = profileImage {
//                        profileImage
//                            .resizable()
//                            .modifier(ProfileImageModifier())
//                    } else {
//                        Image(systemName: "plus.circle")
//                            .resizable()
//                            .modifier(ProfileImageModifier())
//                    }
//                }
//            }
//            .padding(.top, 44)
            
            
            Button {
                viewModel.uploadProfileImage(selectedImage!)
            } label: {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            .disabled(profileImage==nil)
            .padding()
            .onChange(of: image) { newValue in
                print("DEBUG: newValue")
                loadImage()
            }
            

            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        print("DEBUG: newValue1")
        guard let item = image.first else {
            return
        }
        print("DEBUG: newValue2")
        item.loadTransferable(type: Data.self) { result in
            switch result {
            case .success(let data):
                print("DEBUG: newValue3")
                if let data = data {
                    print("DEBUG: newValue4")
                    selectedImage = UIImage(data: data)
                } else {
                    print("DEBUG: newValue5")
                    print("error")
                }
            case .failure(let failure):
                print("DEBUG: newValue6")
                print(failure)
            }
        }
        print("DEBUG: newValue7")
        guard let selectedImage = selectedImage else {return}
        print("DEBUG: newValue8")
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .foregroundColor(Color(.systemBlue))
            .frame(width: 180, height: 180)
            .clipShape(Circle())
            .overlay(Circle().stroke())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

