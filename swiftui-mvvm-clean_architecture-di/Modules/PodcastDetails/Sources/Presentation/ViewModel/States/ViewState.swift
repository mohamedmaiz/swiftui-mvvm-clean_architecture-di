//
//  ExerciceViewState.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 04/01/2026.
//

enum PodcastDetailsViewState : Equatable {
    case idle
    case loading
    case empty
    case loaded
    case error(error: String)
}
