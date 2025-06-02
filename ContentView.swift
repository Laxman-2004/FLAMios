import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MusicPlayerViewModel()

    var body: some View {
        VStack {
            if let song = viewModel.currentSong {
                Text("Now Playing: \(song.title)")
                Text("By: \(song.artist)")
            } else {
                Text("Select a song")
            }

            HStack {
                Button("Previous", action: viewModel.previous)
                Button(viewModel.isPlaying ? "Pause" : "Play") {
                    if viewModel.isPlaying {
                        viewModel.pause()
                    } else if let first = viewModel.queue.first {
                        viewModel.play(song: first)
                    }
                }
                Button("Next", action: viewModel.next)
            }
        }
        .onAppear {
            viewModel.queue = [
                Song(title: "Song A", artist: "Artist 1", source: .local),
                Song(title: "Song B", artist: "Artist 2", source: .spotify)
            ]
        }
    }
}