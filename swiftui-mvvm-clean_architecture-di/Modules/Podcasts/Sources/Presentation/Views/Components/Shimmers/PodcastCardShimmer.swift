//
//  PodcastCardShimmer.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 10/01/2026.
//

import SwiftUI
import Core

struct PodcastCardShimmer: View {
    var body: some View {
        VStack(alignment: .leading){
            ShimmerEffectBox()
                .frame(width: 160 , height: 160)
                .cornerRadius(12)
                .padding(.bottom , 6)
            ShimmerEffectBox()
                .frame(width: 100 , height: 8)
                .cornerRadius(12)
                .padding(.leading , 6)
        }
        .frame(width: 160 , height: 190)
        .padding(.horizontal , 8)
    }
}

#Preview {
    PodcastCardShimmer()
}
