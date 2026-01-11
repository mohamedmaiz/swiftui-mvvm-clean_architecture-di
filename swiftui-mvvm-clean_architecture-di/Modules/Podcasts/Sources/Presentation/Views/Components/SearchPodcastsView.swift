//
//  SearchPodcastsView.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 11/01/2026.
//

import SwiftUI
import Core

struct SearchPodcastsView: View {
    @ObservedObject var podcastsViewModel: PodcastsViewModel
    
    var body: some View {
        
        switch podcastsViewModel.searchState {
        case .idle , .loading :
            ScrollView {
                LazyVStack() {
                    ForEach(0..<4, id: \.self) { _ in
                        PodcastSearchCardShimmer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 16)
            }
        case .empty : Text("there is No Data")
        case .error(let error) : Text("there is an error : \(error)")
        case .loaded:
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(podcastsViewModel.searchResults) { podcast in
                        PodcastSearchCardView(podcast: podcast)
                            .onTapGesture{
                                podcastsViewModel.goToDetails(id: podcast.id)
                            }
                    }
                }
            }
            .padding(.horizontal , 16)
        }
        
    }
}



#Preview {
    let vm = PodcastsFeatureBuilder.makeMockPodcastsViewModel()
    Screen(.black) { SearchPodcastsView(podcastsViewModel: vm)
            .onAppear{
                vm.searchQuery = "apple"
            }
    }
}
