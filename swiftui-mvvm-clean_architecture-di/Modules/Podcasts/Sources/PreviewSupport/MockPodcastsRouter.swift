//
//  MockPodcastsRouter.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 09/01/2026.
//

final class MockPodcastsRouter: PodcastsRouting {
    func route(to route: PodcastsRoute) {
        print("Preview route:", route)
    }
}
