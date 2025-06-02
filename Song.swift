import Foundation

struct Song: Identifiable {
    let id: UUID = UUID()
    let title: String
    let artist: String
    let source: MusicSource
}

enum MusicSource {
    case local
    case spotify
}