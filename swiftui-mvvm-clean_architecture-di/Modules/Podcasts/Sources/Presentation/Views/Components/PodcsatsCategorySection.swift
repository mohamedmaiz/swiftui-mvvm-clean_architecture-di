//
//  PodcsatsCategorySection.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 10/01/2026.
//
import SwiftUI
import Core

struct PodcastsCategorySection: View {
    let title: String
    let subTitle: String?
    let podcasts: [Podcast]
    let onTap: (_: Int) -> Void
    
    init(title: String, subTitle: String? = nil, podcasts: [Podcast], onTap: @escaping (_: Int) -> Void) {
        self.title = title
        self.subTitle = subTitle
        self.podcasts = podcasts
        self.onTap = onTap
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(title)
                    .font(.system(size: 22 , weight: .bold))
                    .foregroundColor(Color.white)
                Image(systemName: "chevron.forward")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal , 16)
            if subTitle != nil {
                Text(subTitle!)
                    .font(.system(size: 14 , weight: .medium))
                    .foregroundColor(Color.gray)
                    .padding(.leading , 16)
            }
            ScrollView(.horizontal , showsIndicators: false) {
                LazyHStack{
                    ForEach(podcasts) { podcat in
                        PodcastCardView(podcast: podcat)
                            .onTapGesture{
                                onTap(podcat.id)
                            }
                    }
                }
            }
        }
        .frame(height: 260)
        .padding(.bottom , 16)
    }
}

#Preview {
    Screen(.black) {
        PodcastsCategorySection(title: "Technology", subTitle: "Based on your listening" ,podcasts: Podcast.technologyFixtures) { _ in }
    }
    
}
