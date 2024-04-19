//
//  TweetRowViewModel.swift
//  TwitterClone
//
//  Created by Tirth on 12/3/22.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    let service = TweetService()
    
    @Published var tweet: Tweet
    init(tweet: Tweet) {
        self.tweet = tweet
        didUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func didUserLikedTweet() {
        service.didUserLikedTweet(self.tweet) { didLiked in
            if didLiked {
                self.tweet.didLike = true
            }
        }
    }
}
