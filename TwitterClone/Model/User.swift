//
//  User.swift
//  TwitterClone
//
//  Created by Tirth on 11/30/22.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
