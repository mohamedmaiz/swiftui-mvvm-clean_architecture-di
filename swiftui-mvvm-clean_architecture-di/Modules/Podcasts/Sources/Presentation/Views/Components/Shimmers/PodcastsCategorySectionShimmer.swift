//
//  PodcastsCategorySectionShimmer.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 10/01/2026.
//
import SwiftUI
import Core

struct PodcastsCategorySectionShimmer: View {
    var body: some View {
        VStack (alignment: .leading){
            ShimmerEffectBox()
                .frame(width: 160 , height: 12)
                .cornerRadius(8)
            HStack(){
                ForEach(0..<2){ _ in
                    PodcastCardShimmer()
                }
                .alignmentGuide(HorizontalAlignment.leading) { _ in  8 }
            }
            .alignmentGuide(HorizontalAlignment.leading) { _ in  8 }
            .frame(height: 200)
        }
        .padding(.bottom , 16)
    }
}


#Preview {
    PodcastsCategorySectionShimmer()
}
