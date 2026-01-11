//
//  FeatureRouterBuilder.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 09/01/2026.
//
import Foundation
import SwiftUI
import Podcasts

@MainActor
final class FeatureRouterBuilder {
    private let appRouter: AppRouter
    
    init(appRouter: AppRouter) { self.appRouter = appRouter }
    
    
    func makePodcastsRouter() -> PodcastsRoter {
        PodcastsRoter { [weak self] featureRoute in
            self?.appRouter.push(.fromPodcastsRoute(featureRoute))
        }
    }
}




