//
//  PodcastsFeatureBuilder.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 06/01/2026.
//
import Core

public struct PodcastDetailsFeatureBuilder {
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func makePodcastDetailsScreen(id: Int) -> PodcastDetailsScreen {
        let remote: PodcastDetailsRemoteData = PodcastDetailsRemoteData(client: apiClient)
        let repo: PodcastDetailsRepository = PodcastDetailsRepository(remote: remote)
        let useCase: PodcastDetailsUseCase = PodcastDetailsUseCase(podcastsRepository: repo)
        let vm: PodcastDetailsViewModel = PodcastDetailsViewModel(podcastDetailsUseCase: useCase)
        return PodcastDetailsScreen(vm: vm , id: id)
    }
    
    static func makePodcastDetailsPreview() -> PodcastDetailsScreen {
        let repo: PodcastDetailsRepositoryProtocol = MockPodcastDetailsRepository()
        let useCase: PodcastDetailsUseCase = PodcastDetailsUseCase(podcastsRepository: repo)
        let vm: PodcastDetailsViewModel = PodcastDetailsViewModel(podcastDetailsUseCase: useCase)
        return PodcastDetailsScreen(vm: vm , id: -1)
    }
}
