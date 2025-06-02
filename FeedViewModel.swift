import Foundation
import Combine

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func loadPosts() {
        // Mock data
        posts = [
            Post(username: "Alice", content: "Hello, world!"),
            Post(username: "Bob", content: "Just had coffee ☕"),
            Post(username: "Charlie", content: "Coding SwiftUI apps is fun!")
        ]
    }

    func refresh() {
        loadPosts()
    }
}