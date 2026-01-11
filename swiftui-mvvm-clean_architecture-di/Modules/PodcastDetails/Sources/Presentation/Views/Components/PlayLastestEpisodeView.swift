//
//  PlayLastestEpisode.swift
//  PodcastDetails
//
//  Created by Mohamed Maiz on 11/01/2026.
//

import SwiftUI

struct PlayLastestEpisodeView: View {
    var body: some View {
        Rectangle()
            .frame(width: 200 , height: 40)
            .cornerRadius(30)
            .foregroundColor(.white.opacity(0.7))
            .overlay {
                HStack {
                    Image(systemName: "play.fill")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 14 , height: 14)
                        .foregroundColor(.black)
                    
                    Text("Lastest Episode")
                        .font(.system(size: 14 , weight: .semibold))
                        .foregroundColor(.black)
                }
            }
    }
}
