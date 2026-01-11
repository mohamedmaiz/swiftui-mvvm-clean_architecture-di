//
//  ExercisesRepository.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Apple on 03/01/2026.
//
import Combine
import Core

class PodcastsRepository: PodcastsRepositoryProtocol {
    private let remote: PodcastsRemoteData
    init(remote: PodcastsRemoteData) {
        self.remote = remote
    }
    
    func searchPodcasts(query: String) -> AnyPublisher<[Podcast], Core.APIError> {
        return remote.searchPodcasts(term: query)
            .map{data in
                data.results.map{$0.toDomain()}
            }
            .eraseToAnyPublisher()
    }
    
    func getTechnologyPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        return remote.fetchTechnologyPodcasts()
            .map{data in
                data.results.map{$0.toDomain()}
            }
            .eraseToAnyPublisher()
    }
    
    func getEnglishPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        return remote.fetchEnglishPodcasts()
            .map{data in
                data.results.map{$0.toDomain()}
            }
            .eraseToAnyPublisher()
    }
    
    func getBusinessPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        return remote.fetchBusinessPodcasts()
            .map{data in
                data.results.map{$0.toDomain()}
            }
            .eraseToAnyPublisher()
    }
    
    func getTedTalksPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        return remote.fetchTedTalksPodcasts()
            .map{data in
                data.results.map{$0.toDomain()}
            }
            .eraseToAnyPublisher()
    }
}



