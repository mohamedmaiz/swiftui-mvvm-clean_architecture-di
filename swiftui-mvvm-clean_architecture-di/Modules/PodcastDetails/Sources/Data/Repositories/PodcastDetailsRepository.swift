//
//  PodcastDetailsRepository.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//
import Combine
import Core

class PodcastDetailsRepository: PodcastDetailsRepositoryProtocol {
    
    private let remote: PodcastDetailsRemoteData
    init(remote: PodcastDetailsRemoteData) {
        self.remote = remote
    }
    func fetchDetails(id: Int) -> AnyPublisher<PodcastDetails, Core.APIError> {
        return remote.fetchDetails(id: id)
            .map{ data in
                data.results.first!.toDomain()
            }
            .eraseToAnyPublisher()
    }
}



