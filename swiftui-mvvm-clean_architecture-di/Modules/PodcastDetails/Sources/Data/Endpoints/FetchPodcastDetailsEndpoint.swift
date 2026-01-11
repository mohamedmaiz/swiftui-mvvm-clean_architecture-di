//
//  FetchExercisesEndpoint.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//
import Core
import Foundation

enum FetchPodcastDetailsEndpoint: Endpoint {
    case fetchDetails(id: Int)
    
    var method:HTTPMethod {.GET}
    var path: String {
        switch self {
        case .fetchDetails(_) : return "/lookup"
        }
    }
    var queryParams: [URLQueryItem]? {
        switch self {
        case .fetchDetails(let id):
            return [URLQueryItem(name: "id", value: String(id))]
        }
    }
    
    
}
