//
//  ExerciesRepositoryProtocol.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//
import Combine
import Core

protocol PodcastsRepositoryProtocol {
    func searchPodcasts(query: String) -> AnyPublisher<[Podcast] , APIError>
    func getTechnologyPodcasts() -> AnyPublisher<[Podcast] , APIError>
    func getEnglishPodcasts() -> AnyPublisher<[Podcast] , APIError>
    func getBusinessPodcasts() -> AnyPublisher<[Podcast] , APIError>
    func getTedTalksPodcasts() -> AnyPublisher<[Podcast] , APIError>
}
