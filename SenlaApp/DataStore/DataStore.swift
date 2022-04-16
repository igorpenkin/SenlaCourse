//
//  DataStore.swift
//  SenlaApp
//
//  Created by Igor Penkin on 09.04.2022.
//

import UIKit


public struct DataStore {
    
    let recentFeeds = [
        RecentFeed(id: 0, title: "Recent feed", imageUrl: "lasso.and.sparkles"),
        RecentFeed(id: 1, title: "Recent feed", imageUrl: "lasso.and.sparkles"),
        RecentFeed(id: 2, title: "Recent feed", imageUrl: "lasso.and.sparkles"),
        RecentFeed(id: 3, title: "Recent feed", imageUrl: "lasso.and.sparkles"),
        RecentFeed(id: 4, title: "Recent feed", imageUrl: "lasso.and.sparkles"),
        RecentFeed(id: 5, title: "Recent feed", imageUrl: "lasso.and.sparkles"),
    ]
    let popularFeed = [
        PopularFeed(id: 0, title: "Popular feed", imageUrl: "paperplane.fill"),
        PopularFeed(id: 1, title: "Popular feed", imageUrl: "paperplane.fill"),
        PopularFeed(id: 2, title: "Popular feed", imageUrl: "paperplane.fill"),
        PopularFeed(id: 3, title: "Popular feed", imageUrl: "paperplane.fill"),
        PopularFeed(id: 4, title: "Popular feed", imageUrl: "paperplane.fill"),
        PopularFeed(id: 5, title: "Popular feed", imageUrl: "paperplane.fill"),
    ]
    let ordinaryFeed = [
        OrdinaryFeed(id: 0, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 1, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 2, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 3, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 4, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 5, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 6, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 7, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
        OrdinaryFeed(id: 8, title: "Ordinary feed", imageUrl: "list.bullet.rectangle"),
    ]
}


struct RecentFeed {
    let id: Int
    let title: String
    let imageUrl: String
}


struct PopularFeed {
    let id: Int
    let title: String
    let imageUrl: String
}


struct OrdinaryFeed {
    let id: Int
    let title: String
    let imageUrl: String
}
