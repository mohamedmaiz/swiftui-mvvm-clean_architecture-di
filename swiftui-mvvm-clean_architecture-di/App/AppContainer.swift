//
//  AppContainer.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 07/01/2026.
//
import Core
import Podcasts
import PodcastDetails

@MainActor
struct AppContainer {
    let appRouter: AppRouter
    let routerBuilder: FeatureRouterBuilder
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
        self.routerBuilder = FeatureRouterBuilder(appRouter: appRouter)
    }
    
    let apiClient: APIClient = APIClient()
    
    func makePodcastsFeature() -> PodcastsFeatureBuilder {
        return PodcastsFeatureBuilder(apiClient: apiClient)
    }
    
    func makePodcastDetailsFeature() -> PodcastDetailsFeatureBuilder {
        return PodcastDetailsFeatureBuilder(apiClient: apiClient)
    }
}
