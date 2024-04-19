//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by Tirth on 12/3/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    let service = TweetService()
    let userService = UserService()
    let user: User

    init(user: User) {
        self.user = user
        self.fetchUserTweets()
        self.fetchLikedTweets()
    }
    
    var actionButtonTitle: String {
        return self.user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    func tweets(forFiler filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
    }
    
    func fetchUserTweets() {
        guard let uid = user.id else {return}
        
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
    func fetchLikedTweets() {
        guard let uid = user.id else {return}
        self.service.fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            for i in 0..<tweets.count {
                self.userService.fetchUser(withUid: tweets[i].uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
}
