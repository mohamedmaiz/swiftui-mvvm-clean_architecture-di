//
//  ExercisesListView.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//

import SwiftUI
import Core
import Kingfisher

public struct PodcastsScreen: View {
    @StateObject var podcastsViewModel: PodcastsViewModel
    
    public var body: some View {
        
        Screen(
            LinearGradient(colors: [
                Color(hex: "#10214f"),
                Color(hex: "#030712")],
                           startPoint: .top,
                           endPoint: .bottom)
        ) {
            if podcastsViewModel.searchQuery.isEmpty {
                PodcastsContentView(podcastsViewModel: podcastsViewModel)
            }else {
                SearchPodcastsView(podcastsViewModel: podcastsViewModel)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack{
                    Text("Podcasts")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                HStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .frame(width: 28 , height: 28)
                    
                }
            }
        }
        .searchable(text: $podcastsViewModel.searchQuery)
        .foregroundColor(.white)
        .onViewDidLoad{
            podcastsViewModel.viewDidLoad()
        }
    }
    
}

#Preview {
    let vm = PodcastsFeatureBuilder.makeMockPodcastsViewModel()
    PodcastsScreen(podcastsViewModel: vm)
}

