
import Foundation

struct Podcast: Identifiable, Hashable {
    let id: Int
    let artistName: String
    let title: String
    
    let genre: String?
    let releaseDate: Date?
    
    let artwork60: URL?
    let artwork100: URL?
    let artwork600: URL?
    
    let collectionURL: URL?
    let artistURL: URL?
    let previewURL: URL?
    let description: String?
    let country: String?
}

