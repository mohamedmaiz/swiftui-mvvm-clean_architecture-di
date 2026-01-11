//
//  ExerciesUseCase.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Apple on 03/01/2026.
//

import Combine
import Core

struct PodcastsUseCase {
    private let repository: PodcastsRepositoryProtocol
    
    init(podcastsRepository: PodcastsRepositoryProtocol) {
        self.repository = podcastsRepository
    }
    func searchPodcasts(query: String) -> AnyPublisher<[Podcast] , APIError> {
        return repository.searchPodcasts(query: query)
    }
    func fetchTechnologyPodcasts() -> AnyPublisher<[Podcast] , APIError> {
        return repository.getTechnologyPodcasts()
    }
    func fetchEnglishPodcasts() -> AnyPublisher<[Podcast] , APIError> {
        return repository.getEnglishPodcasts()
    }
    func fetchBusinessPodcasts() -> AnyPublisher<[Podcast] , APIError> {
        return repository.getBusinessPodcasts()
    }
    func fetchTedTalksPodcasts() -> AnyPublisher<[Podcast] , APIError> {
        return repository.getTedTalksPodcasts()
    }
}
