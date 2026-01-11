//
//  PodcastsNavigation.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 09/01/2026.
//

public protocol PodcastsRouting {
    func route(to route: PodcastsRoute)
}

public final class PodcastsRoter : PodcastsRouting {
    private let handler: (PodcastsRoute) -> Void
    
    public init(handler: @escaping (PodcastsRoute) -> Void) {
        self.handler = handler
    }
    
    public func route(to route: PodcastsRoute) {
        handler(route)
    }
}


public enum PodcastsRoute: Hashable {
    case details(id: Int)
}
