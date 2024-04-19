//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by Tirth on 12/3/22.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var uploadedTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.uploadedTweet = true
            }
        }
    }
}
