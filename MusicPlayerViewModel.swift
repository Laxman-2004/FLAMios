import Foundation
import Combine

class MusicPlayerViewModel: ObservableObject {
    @Published var currentSong: Song?
    @Published var isPlaying: Bool = false
    @Published var queue: [Song] = []
    private var cancellables = Set<AnyCancellable>()

    func play(song: Song) {
        currentSong = song
        isPlaying = true
        // Mock playback
        print("Playing \(song.title) by \(song.artist)")
    }

    func pause() {
        isPlaying = false
    }

    func next() {
        guard let current = currentSong, let index = queue.firstIndex(where: { $0.id == current.id }), index + 1 < queue.count else { return }
        play(song: queue[index + 1])
    }

    func previous() {
        guard let current = currentSong, let index = queue.firstIndex(where: { $0.id == current.id }), index > 0 else { return }
        play(song: queue[index - 1])
    }
}