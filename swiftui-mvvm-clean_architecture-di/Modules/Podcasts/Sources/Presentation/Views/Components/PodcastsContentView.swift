//
//  PodcastsContentView.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 11/01/2026.
//

import SwiftUI
import Core
struct PodcastsContentView: View {
    @ObservedObject var podcastsViewModel: PodcastsViewModel
    var body: some View {
        switch podcastsViewModel.state {
        case .empty , .idle : Text("there is No Data")
        case .error(let error) : Text("there is an error : \(error)")
        case .loading :
            ScrollView {
                LazyVStack() {
                    ForEach(0..<3, id: \.self) { _ in
                        PodcastsCategorySectionShimmer()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 16)
            }
        case .loaded:
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(podcastsViewModel.sections) { section in
                        PodcastsCategorySection(title: section.title,
                                                subTitle: section.subTitle,
                                                podcasts: section.podcasts){ id in
                            podcastsViewModel.goToDetails(id: id)
                            
                        }
                    }
                }
            }
            .refreshable {
                podcastsViewModel.viewDidLoad()
            }
            
        }
    }
}


#Preview {
    let vm = PodcastsFeatureBuilder.makeMockPodcastsViewModel()
    Screen(.black) { PodcastsContentView(podcastsViewModel: vm)
            .onAppear{
                vm.viewDidLoad()
            }
    }
}
