//
//  Tweet.swift
//  TwitterClone
//
//  Created by Tirth on 12/3/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Codable, Identifiable {
    @DocumentID var id: String?
    let caption: String
    let uid: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
