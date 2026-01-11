//
//  ExerciseMapper.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//

import Foundation

extension PodcastDTO {
    func toDomain() -> Podcast {
        Podcast(
            id: collectionId,
            artistName: artistName ?? "Unknown Artist",
            title: collectionName ?? "Untitled",
            genre: primaryGenreName,
            releaseDate: Self.parseISO8601(releaseDate),
            artwork60: URL(string: artworkUrl60 ?? ""),
            artwork100: URL(string: artworkUrl100 ?? ""),
            artwork600: URL(string: artworkUrl600 ?? ""),
            collectionURL: URL(string: collectionViewUrl ?? ""),
            artistURL: URL(string: artistViewUrl ?? ""),
            previewURL: URL(string: previewUrl ?? ""),
            description: description,
            country: country
        )
    }
    
    private static func parseISO8601(_ value: String?) -> Date? {
        guard let value else { return nil }
        return ISO8601DateFormatter().date(from: value)
    }
}
