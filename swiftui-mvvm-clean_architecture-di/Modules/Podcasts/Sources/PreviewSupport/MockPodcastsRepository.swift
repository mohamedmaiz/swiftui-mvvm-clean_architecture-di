//
//  MockPodcastsRepository.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 07/01/2026.
//

import Combine
import Core
class MockPodcastsRepository: PodcastsRepositoryProtocol {
    func searchPodcasts(query: String) -> AnyPublisher<[Podcast], Core.APIError> {
        Just(Podcast.technologyFixtures)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    func getTechnologyPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        Just(Podcast.technologyFixtures)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    
    func getEnglishPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        Just(Podcast.englishLearningFixtures)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    
    func getBusinessPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        Just(Podcast.businessFixtures)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    
    func getTedTalksPodcasts() -> AnyPublisher<[Podcast], Core.APIError> {
        Just(Podcast.tedTalksFixtures)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    
    
}
