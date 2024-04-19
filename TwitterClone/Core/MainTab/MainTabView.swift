//
//  MainTabView.swift
//  TwitterClone
//
//  Created by Tirth on 11/26/22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                }
            
            MessagesView()
                .tabItem {
                    Image(systemName: "envelope")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
