//
//  MockPodcastsRepository.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 07/01/2026.
//

import Combine
import Core

class MockPodcastDetailsRepository: PodcastDetailsRepositoryProtocol {
    func fetchDetails(id: Int) -> AnyPublisher<PodcastDetails, Core.APIError> {
        Just(PodcastDetails.fakePodcast)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
}
