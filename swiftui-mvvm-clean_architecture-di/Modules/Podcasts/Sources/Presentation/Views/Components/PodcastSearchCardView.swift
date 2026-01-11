//
//  PodcastSearchCardView.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 11/01/2026.
//
import SwiftUI
import Kingfisher

struct PodcastSearchCardView: View {
    let podcast: Podcast
    
    var body: some View {
        HStack {
            KFImage(podcast.artwork600)
                .resizable()
                .placeholder{
                    ProgressView()
                    
                }
                .frame(width: 130 , height: 120)
                .cornerRadius(8)
                .padding(12)
            
            VStack(alignment: .leading){
                Spacer()
                Text(podcast.title)
                    .font(.system(size: 16 , weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Text(podcast.artistName)
                    .font(.system(size: 12 , weight: .light))
                    .foregroundColor(.white.opacity(0.6))
                Spacer()
            }
            .padding(.vertical , 16)
            
            Spacer()
        }
        .frame(height: 130)
        .background{Color(hex: "#111827").opacity(0.3)}
        .border(Color(hex: "#1d2634"), width: 1)
        .cornerRadius(8)
    }
}


#Preview {
    PodcastSearchCardView(podcast: Podcast.technologyFixtures.first!)
}
