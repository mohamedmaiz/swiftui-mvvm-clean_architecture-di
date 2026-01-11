//
//  PodcastsFeatureBuilder.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 06/01/2026.
//
import Core

public struct PodcastsFeatureBuilder {
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func makePodcastsScreen(router: PodcastsRoter) -> PodcastsScreen {
        let remote: PodcastsRemoteData = PodcastsRemoteData(client: apiClient)
        let repo: PodcastsRepository = PodcastsRepository(remote: remote)
        let useCase: PodcastsUseCase = PodcastsUseCase(podcastsRepository: repo)
        let vm: PodcastsViewModel = PodcastsViewModel(podcastsUseCase: useCase , router: router)
        return PodcastsScreen(podcastsViewModel: vm)
    }
    
    static func makeMockPodcastsViewModel() -> PodcastsViewModel {
        let router: PodcastsRouting = MockPodcastsRouter()
        let repo: PodcastsRepositoryProtocol = MockPodcastsRepository()
        let useCase: PodcastsUseCase = PodcastsUseCase(podcastsRepository: repo)
        return PodcastsViewModel(podcastsUseCase: useCase , router: router)
    }
    
}
