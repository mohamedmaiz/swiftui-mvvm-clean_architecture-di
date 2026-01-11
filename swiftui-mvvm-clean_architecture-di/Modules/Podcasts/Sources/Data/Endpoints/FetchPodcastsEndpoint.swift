//
//  FetchExercisesEndpoint.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//
import Core
import Foundation

enum FetchPodcastsEndpoint: Endpoint {
    case fetchTechnologyPodcasts
    case fetchEnglishPodcasts
    case fetchBusinessPodcasts
    case fetchTedTalksPodcasts
    case seachPodcasts(query: String)
    
    var method:HTTPMethod {.GET}
    var path: String {
        switch self {
        case .fetchTechnologyPodcasts: return "/search"
        case .fetchEnglishPodcasts: return "/search"
        case .fetchBusinessPodcasts : return "/search"
        case .fetchTedTalksPodcasts : return "/search"
        case .seachPodcasts(_) : return "/search"
        }
    }
    var queryParams: [URLQueryItem]? {
        switch self {
        case .fetchTechnologyPodcasts:
            return buildQueryParams(term: "technology")
        case .fetchEnglishPodcasts:
            return buildQueryParams(term: "learn+english")
        case .fetchBusinessPodcasts:
            return buildQueryParams(term: "business")
        case .fetchTedTalksPodcasts:
            return buildQueryParams(term: "TED+Talks")
        case .seachPodcasts(let query):
            return buildQueryParams(term: query)
        }
    }
    
    private func buildQueryParams(term: String , media: String = "podcast" , entity: String = "podcast") -> [URLQueryItem] {
        return [URLQueryItem(name: "term", value: term),
                URLQueryItem(name: "media", value: media),
                URLQueryItem(name: "entity", value: entity)
        ]
        
    }
    
}
