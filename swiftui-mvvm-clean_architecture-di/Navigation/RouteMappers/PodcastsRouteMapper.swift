//
//  PodcastsRouteMapper.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 09/01/2026.
//

import Podcasts

extension AppRoute {
    static func fromPodcastsRoute(_ route: PodcastsRoute) -> AppRoute {
        switch route {
        case .details(let id): return .podcastDetails(id: id)
        }
    }
}

