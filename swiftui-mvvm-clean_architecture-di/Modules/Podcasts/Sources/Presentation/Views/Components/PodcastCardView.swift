//
//  PodcastCardView.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 10/01/2026.
//

import SwiftUI
import Kingfisher
import Core

struct PodcastCardView: View {
    let podcast: Podcast
    var body: some View {
        
        VStack(alignment: .leading){
            KFImage(podcast.artwork600 )
                .resizable()
                .placeholder{
                    ProgressView()
                    
                }
                .frame(width: 160 , height: 160)
                .cornerRadius(12)
                .padding(.bottom , 6)
            Text(podcast.title)
                .font(.system(size: 13 , weight: .medium))
                .foregroundColor(.white)
                .padding(.leading , 8)
        }
        .frame(width: 160 , height: 190)
        .padding(.horizontal , 8)
    }
}


#Preview {
    Screen(.black) {
        PodcastCardView(podcast: Podcast.technologyFixtures.first!)
    }
    
}
