//
//  ExerciesUseCase.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Apple on 03/01/2026.
//

import Combine
import Core

struct PodcastDetailsUseCase {
    private let repository: PodcastDetailsRepositoryProtocol
    
    init(podcastsRepository: PodcastDetailsRepositoryProtocol) {
        self.repository = podcastsRepository
    }
    func fetchDetails(id: Int) -> AnyPublisher<PodcastDetails , APIError> {
        return repository.fetchDetails(id: id)
    }
    
}
