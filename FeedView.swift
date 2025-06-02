import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.username).font(.headline)
                    Text(post.content).font(.body)
                }
            }
            .navigationTitle("Feed")
            .refreshable {
                viewModel.refresh()
            }
            .onAppear {
                viewModel.loadPosts()
            }
        }
    }
}