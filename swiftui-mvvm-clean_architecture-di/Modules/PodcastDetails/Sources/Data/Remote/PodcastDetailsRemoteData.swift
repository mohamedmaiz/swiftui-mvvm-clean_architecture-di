//
//  ExercisesRemoteData.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Apple on 03/01/2026.
//
import Foundation
import Combine
import Core

protocol PodcastDetailsRemoteDataProtocol {
    func fetchDetails(id: Int) -> AnyPublisher<PagedResponse, APIError>
}


class PodcastDetailsRemoteData : PodcastDetailsRemoteDataProtocol {
    private let client: APIClient
    init(client: APIClient) {
        self.client = client
    }
    
    func fetchDetails(id: Int) -> AnyPublisher<PagedResponse, Core.APIError> {
        let endpoint: Endpoint = FetchPodcastDetailsEndpoint.fetchDetails(id: id)
        return client.run( PagedResponse.self ,endpoint)
            .eraseToAnyPublisher()
    }
    
    
    
    
}
