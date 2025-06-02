import Foundation

struct Post: Identifiable {
    let id: UUID = UUID()
    let username: String
    let content: String
}