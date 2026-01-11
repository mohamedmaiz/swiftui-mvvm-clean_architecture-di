//
//  Podcast+Fixtures.swift
//  Podcasts
//
//  Created by Mohamed Maiz on 07/01/2026.
//
import Foundation
#if DEBUG
extension Podcast {
    
    static func fixture(
        id: Int,
        artistName: String,
        title: String,
        description: String,
        country: String = "US",
        artwork60: String,
        artwork100: String,
        artwork600: String
        
    ) -> Podcast {
        Podcast(
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
            country: country
        )
    }
}
extension Podcast {
    
    static let technologyFixtures: [Podcast] = [
        fixture(
            id: 1528594034,
            artistName: "John Sundell",
            title: "Swift by Sundell",
            description: "In-depth conversations about Swift, SwiftUI, iOS development, and Apple platforms.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/44/ab/5a/44ab5a4e-2a9c-9c62-1d6d-9d1bb1c4c8f0/SwiftBySundell.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/44/ab/5a/44ab5a4e-2a9c-9c62-1d6d-9d1bb1c4c8f0/SwiftBySundell.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/44/ab/5a/44ab5a4e-2a9c-9c62-1d6d-9d1bb1c4c8f0/SwiftBySundell.png/100x100bb.jpg"
            
        ),
        fixture(
            id: 1434243584,
            artistName: "Lex Fridman",
            title: "Lex Fridman Podcast",
            description: "Conversations about artificial intelligence, science, programming, and technology.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/13/36/6f/13366f2f-9d03-fb9c-24d6-f78c5b9f88cc/LexFridmanPodcast.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/13/36/6f/13366f2f-9d03-fb9c-24d6-f78c5b9f88cc/LexFridmanPodcast.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/13/36/6f/13366f2f-9d03-fb9c-24d6-f78c5b9f88cc/LexFridmanPodcast.png/100x100bb.jpg"
        ),
        fixture(
            id: 1253186678,
            artistName: "Wes Bos & Scott Tolinski",
            title: "Syntax – Tasty Web Development",
            description: "A fun podcast about web development, JavaScript, frameworks, and career growth.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/6a/88/6e/6a886e1b-8a45-16c5-8db5-d58b5a98b0c6/Syntax.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/6a/88/6e/6a886e1b-8a45-16c5-8db5-d58b5a98b0c6/Syntax.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts122/v4/6a/88/6e/6a886e1b-8a45-16c5-8db5-d58b5a98b0c6/Syntax.png/100x100bb.jpg"
        ),
        fixture(
            id: 1097495355,
            artistName: "Stack Overflow",
            title: "The Stack Overflow Podcast",
            description: "Stories and insights from developers building modern software.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/0c/92/2f/0c922f57-fb1a-b5f6-2ad1-69c7cdbad58f/StackOverflow.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/0c/92/2f/0c922f57-fb1a-b5f6-2ad1-69c7cdbad58f/StackOverflow.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/0c/92/2f/0c922f57-fb1a-b5f6-2ad1-69c7cdbad58f/StackOverflow.png/100x100bb.jpg"
        )
    ]
    
    static let englishLearningFixtures: [Podcast] = [
        fixture(
            id: 262026947,
            artistName: "BBC Learning English",
            title: "6 Minute English",
            description: "Short episodes to help learners improve English vocabulary and listening skills.",
            country: "GB",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/4d/5a/8d/4d5a8dd4-92d6-3f5f-8df2-15b38bdb8b2d/6MinuteEnglish.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/4d/5a/8d/4d5a8dd4-92d6-3f5f-8df2-15b38bdb8b2d/6MinuteEnglish.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/4d/5a/8d/4d5a8dd4-92d6-3f5f-8df2-15b38bdb8b2d/6MinuteEnglish.png/100x100bb.jpg"
        ),
        fixture(
            id: 1444083620,
            artistName: "British Council",
            title: "LearnEnglish Podcast",
            description: "Practical English listening practice for everyday situations.",
            country: "GB",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts113/v4/45/0d/91/450d91ad-bdb4-d7a7-18fa-55bcb7b66c98/LearnEnglish.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts113/v4/45/0d/91/450d91ad-bdb4-d7a7-18fa-55bcb7b66c98/LearnEnglish.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts113/v4/45/0d/91/450d91ad-bdb4-d7a7-18fa-55bcb7b66c98/LearnEnglish.png/100x100bb.jpg"
            
        ),
        fixture(
            id: 1091469505,
            artistName: "Luke Thompson",
            title: "Luke’s English Podcast",
            description: "Real-life English conversations to help learners improve listening and vocabulary.",
            country: "GB",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/9f/1d/7c/9f1d7c1b-f09d-47b2-3b0a-71d9a6f3e23c/LukesEnglishPodcast.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/9f/1d/7c/9f1d7c1b-f09d-47b2-3b0a-71d9a6f3e23c/LukesEnglishPodcast.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/9f/1d/7c/9f1d7c1b-f09d-47b2-3b0a-71d9a6f3e23c/LukesEnglishPodcast.png/100x100bb.jpg"
        ),
        fixture(
            id: 759084399,
            artistName: "ESLPod",
            title: "English as a Second Language Podcast",
            description: "Clear explanations of English expressions, grammar, and usage.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/83/cc/98/83cc9850-5f0b-7ef0-17cb-9b4db0e90c14/ESLPod.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/83/cc/98/83cc9850-5f0b-7ef0-17cb-9b4db0e90c14/ESLPod.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/83/cc/98/83cc9850-5f0b-7ef0-17cb-9b4db0e90c14/ESLPod.png/100x100bb.jpg"
        )
    ]
    
    static let businessFixtures: [Podcast] = [
        fixture(
            id: 152022135,
            artistName: "Harvard Business Review",
            title: "HBR IdeaCast",
            description: "Weekly insights from leading thinkers in business and management.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/9e/9d/2f/9e9d2f9b-22d4-33fa-1b4c-f78fef5c4b33/HBRIdeaCast.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/9e/9d/2f/9e9d2f9b-22d4-33fa-1b4c-f78fef5c4b33/HBRIdeaCast.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/9e/9d/2f/9e9d2f9b-22d4-33fa-1b4c-f78fef5c4b33/HBRIdeaCast.png/100x100bb.jpg"
        ),
        fixture(
            id: 1150510297,
            artistName: "Guy Raz",
            title: "How I Built This",
            description: "Stories behind the founders of the world’s most successful companies.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts116/v4/47/09/69/470969f5-8f35-1c78-5cb7-71d7e68d9e06/HowIBuiltThis.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts116/v4/47/09/69/470969f5-8f35-1c78-5cb7-71d7e68d9e06/HowIBuiltThis.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts116/v4/47/09/69/470969f5-8f35-1c78-5cb7-71d7e68d9e06/HowIBuiltThis.png/100x100bb.jpg"
        ),
        fixture(
            id: 565959476,
            artistName: "NPR",
            title: "Planet Money",
            description: "Explaining the economy through engaging stories and real-world examples.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/69/4d/9f/694d9f56-6ef1-bfa1-5c38-b5d6ccf84b41/PlanetMoney.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/69/4d/9f/694d9f56-6ef1-bfa1-5c38-b5d6ccf84b41/PlanetMoney.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/69/4d/9f/694d9f56-6ef1-bfa1-5c38-b5d6ccf84b41/PlanetMoney.png/100x100bb.jpg"
        ),
        fixture(
            id: 939752533,
            artistName: "Reid Hoffman",
            title: "Masters of Scale",
            description: "How great companies grow from startup to global scale.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/91/0f/9e/910f9e4b-8a4b-7b72-25c2-4f76bdf4e9d1/MastersOfScale.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/91/0f/9e/910f9e4b-8a4b-7b72-25c2-4f76bdf4e9d1/MastersOfScale.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/91/0f/9e/910f9e4b-8a4b-7b72-25c2-4f76bdf4e9d1/MastersOfScale.png/100x100bb.jpg"
        )
    ]
    
    static let tedTalksFixtures: [Podcast] = [
        fixture(
            id: 160904630,
            artistName: "TED",
            title: "TED Talks Daily",
            description: "Every weekday, TED Talks Daily brings you the latest talks in audio form.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/8b/2a/9a/8b2a9ac8-80a5-06fd-b3c7-5b8c8e25f1b4/TEDTalksDaily.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/8b/2a/9a/8b2a9ac8-80a5-06fd-b3c7-5b8c8e25f1b4/TEDTalksDaily.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts125/v4/8b/2a/9a/8b2a9ac8-80a5-06fd-b3c7-5b8c8e25f1b4/TEDTalksDaily.png/100x100bb.jpg"
        ),
        fixture(
            id: 969230160,
            artistName: "TED",
            title: "TED Business",
            description: "Ideas and strategies from TED Talks focused on leadership and innovation.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts113/v4/7a/49/91/7a4991f3-8b9b-1f44-fc6c-7a6c8b2b7db5/TEDBusiness.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts113/v4/7a/49/91/7a4991f3-8b9b-1f44-fc6c-7a6c8b2b7db5/TEDBusiness.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts113/v4/7a/49/91/7a4991f3-8b9b-1f44-fc6c-7a6c8b2b7db5/TEDBusiness.png/100x100bb.jpg"
        ),
        fixture(
            id: 470623175,
            artistName: "TED",
            title: "TED Health",
            description: "Powerful TED Talks on health, medicine, and human wellbeing.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/3a/8b/45/3a8b4584-fec0-17f4-0a91-ec8e4a3b88d4/TEDHealth.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/3a/8b/45/3a8b4584-fec0-17f4-0a91-ec8e4a3b88d4/TEDHealth.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts126/v4/3a/8b/45/3a8b4584-fec0-17f4-0a91-ec8e4a3b88d4/TEDHealth.png/100x100bb.jpg"
        ),
        fixture(
            id: 957050386,
            artistName: "TED",
            title: "TED Technology",
            description: "Exploring the future of technology through inspiring TED speakers.",
            country: "US",
            artwork60: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/1b/73/3c/1b733c6f-b6c0-7a8b-9b74-9eaa2a8b0d88/TEDTechnology.png/60x60bb.jpg",
            artwork100: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/1b/73/3c/1b733c6f-b6c0-7a8b-9b74-9eaa2a8b0d88/TEDTechnology.png/100x100bb.jpg",
            artwork600: "https://is1-ssl.mzstatic.com/image/thumb/Podcasts115/v4/1b/73/3c/1b733c6f-b6c0-7a8b-9b74-9eaa2a8b0d88/TEDTechnology.png/100x100bb.jpg"
        )
    ]
}
#endif
