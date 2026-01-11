//
//  PodcastSearchCardShimmer.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 11/01/2026.
//

import SwiftUI
import Core

struct PodcastSearchCardShimmer: View {
    var body: some View {
        HStack {
            ShimmerEffectBox()
                .frame(width: 130 , height: 120)
                .cornerRadius(8)
                .padding(12)
            
            VStack(alignment: .leading){
                Spacer()
                ShimmerEffectBox()
                    .frame(width: 120 , height: 6)
                    .cornerRadius(8)
                Spacer()
                ShimmerEffectBox()
                    .frame(width: 70 , height: 4)
                    .cornerRadius(8)
                Spacer()
            }
            .padding(.vertical , 16)
            
            Spacer()
        }
        .frame(height: 130)
        .background{Color(hex: "#111827").opacity(0.3)}
        .cornerRadius(8)
    }
}


#Preview {
    PodcastSearchCardShimmer()
}
