//
//  ExercisesRemoteData.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Apple on 03/01/2026.
//
import Foundation
import Combine
import Core

protocol PodcastsRemoteDataProtocol {
    func searchPodcasts(term: String) -> AnyPublisher<PagedResponse, APIError>
    func fetchTechnologyPodcasts() -> AnyPublisher<PagedResponse, APIError>
    func fetchEnglishPodcasts() -> AnyPublisher<PagedResponse, APIError>
    func fetchBusinessPodcasts() -> AnyPublisher<PagedResponse, APIError>
    func fetchTedTalksPodcasts() -> AnyPublisher<PagedResponse, APIError>
    
}


class PodcastsRemoteData : PodcastsRemoteDataProtocol {
    
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func searchPodcasts(term: String) -> AnyPublisher<PagedResponse, Core.APIError> {
        let endpoint: Endpoint = FetchPodcastsEndpoint.seachPodcasts(query: term)
        return client.run( PagedResponse.self ,endpoint)
            .eraseToAnyPublisher()
    }
    func fetchTechnologyPodcasts() -> AnyPublisher<PagedResponse, Core.APIError> {
        let endpoint: Endpoint = FetchPodcastsEndpoint.fetchTechnologyPodcasts
        return client.run( PagedResponse.self ,endpoint)
            .eraseToAnyPublisher()
    }
    
    func fetchEnglishPodcasts() -> AnyPublisher<PagedResponse, Core.APIError> {
        let endpoint: Endpoint = FetchPodcastsEndpoint.fetchEnglishPodcasts
        return client.run( PagedResponse.self ,endpoint)
            .eraseToAnyPublisher()
    }
    
    func fetchBusinessPodcasts() -> AnyPublisher<PagedResponse, Core.APIError> {
        let endpoint: Endpoint = FetchPodcastsEndpoint.fetchBusinessPodcasts
        return client.run( PagedResponse.self ,endpoint)
            .eraseToAnyPublisher()
    }
    
    func fetchTedTalksPodcasts() -> AnyPublisher<PagedResponse, Core.APIError> {
        let endpoint: Endpoint = FetchPodcastsEndpoint.fetchTedTalksPodcasts
        return client.run( PagedResponse.self ,endpoint)
            .eraseToAnyPublisher()
    }
    
}
