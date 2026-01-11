//
//  PodcastCategorySection.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 11/01/2026.
//

import Foundation

struct PodcastCategorySection: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String?
    let podcasts: [Podcast]
    
    init(title: String, subTitle: String? = nil, podcasts: [Podcast]) {
        self.title = title
        self.subTitle = subTitle
        self.podcasts = podcasts
        
    }
}
