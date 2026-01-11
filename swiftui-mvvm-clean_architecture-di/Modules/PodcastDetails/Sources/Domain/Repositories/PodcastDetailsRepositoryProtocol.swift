//
//  ExerciesRepositoryProtocol.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//
import Combine
import Core

protocol PodcastDetailsRepositoryProtocol {
    func fetchDetails(id: Int) -> AnyPublisher<PodcastDetails , APIError>
}
