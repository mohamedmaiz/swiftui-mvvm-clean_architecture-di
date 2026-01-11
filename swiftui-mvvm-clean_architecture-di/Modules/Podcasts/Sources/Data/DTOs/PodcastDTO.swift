//
//  ExerciseDTO.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//

struct PodcastDTO: Decodable {
    var id: Int { collectionId }
    
    let wrapperType: String?
    let artistId: Int?
    let collectionId: Int
    
    let amgArtistId: Int?
    let artistName: String?
    let collectionName: String?
    let collectionCensoredName: String?
    
    let artistViewUrl: String?
    let collectionViewUrl: String?
    
    let artworkUrl60: String?
    let artworkUrl100: String?
    let artworkUrl600: String?
    
    let collectionPrice: Double?
    let collectionExplicitness: String?
    let trackCount: Int?
    
    let copyright: String?
    let country: String?
    let currency: String?
    
    let releaseDate: String?
    let primaryGenreName: String?
    
    let previewUrl: String?
    let description: String?
}
