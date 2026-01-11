//
//  Podcast+Fixtures.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 07/01/2026.
//
import Foundation
#if DEBUG
extension PodcastDetails {
    
    static func fixture(
        id: Int,
        artistName: String,
        title: String,
        description: String,
        country: String = "US",
        artwork60: String,
        artwork100: String,
        artwork600: String
        
    ) -> PodcastDetails {
        PodcastDetails(
            id: id,
            artistName: artistName,
            title: title,
            genre: nil,
            releaseDate: Date(),
            artwork60:  URL(string: "https://example.com/artist/\(artistName)"),
            artwork100:  URL(string: "https://example.com/artist/\(artistName)"),
            artwork600: nil ,
            collectionURL:  nil,
            artistURL: nil,
            previewURL: nil,
            description: description,
            country: country,
            genreIds: [],
            genres: ["Education", "Podcasts", "Technology"]
            
        )
    }
}
extension PodcastDetails {
    
    static let fakePodcast: PodcastDetails = fixture(
        id: 1528594034,
        artistName: "John Sundell",
        title: "Swift by Sundell",
        description: "In-depth conversations about Swift, SwiftUI, iOS development, and Apple platforms.",
        country: "US",
        artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/44/ab/5a/44ab5a4e-2a9c-9c62-1d6d-9d1bb1c4c8f0/SwiftBySundell.png/60x60bb.jpg",
        artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/44/ab/5a/44ab5a4e-2a9c-9c62-1d6d-9d1bb1c4c8f0/SwiftBySundell.png/100x100bb.jpg",
        artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/44/ab/5a/44ab5a4e-2a9c-9c62-1d6d-9d1bb1c4c8f0/SwiftBySundell.png/100x100bb.jpg"
        
    )
}
#endif
