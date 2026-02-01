import SwiftUI

struct JournalView: View {

    @ObservedObject private var journal = ArtJournalStore.shared

    var body: some View {
        ZStack {

            // 🌌 FULL SCREEN BACKGROUND
            LinearGradient(
                colors: [
                    Color(red: 8/255, green: 12/255, blue: 30/255),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {

                Text("My Art Journal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 16)

                if journal.entries.isEmpty {
                    Spacer()

                    Text("Your saved artworks will appear here ✨")
                        .foregroundColor(.white.opacity(0.5))
                        .frame(maxWidth: .infinity, alignment: .center)

                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(journal.entries) { entry in
                                JournalCard(entry: entry)
                            }
                        }
                        .padding(.bottom, 40)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar) // 🔑 IMPORTANT
    }
}
