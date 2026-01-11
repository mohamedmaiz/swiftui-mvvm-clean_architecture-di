//
//  AppRootView.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 09/01/2026.
//

import SwiftUI
import Core

struct AppRootView: View {
    @StateObject private var appRouter: AppRouter
    let container: AppContainer
    
    init() {
        let router = AppRouter()
        _appRouter = StateObject(wrappedValue: router )
        self.container = AppContainer(appRouter: router)
    }
    var body: some View {
        NavigationStack(path: $appRouter.path) {
            container.makePodcastsFeature()
                .makePodcastsScreen(router: container.routerBuilder.makePodcastsRouter())
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .podcastDetails(let id):
                        return container.makePodcastDetailsFeature().makePodcastDetailsScreen(id: id)
                    }
                }
        }
    }
}
