import SwiftUI

struct JournalView: View {

    var body: some View {
        NavigationStack {
            ZStack {

                LinearGradient(
                    colors: [
                        Color.black,
                        Color(red: 10/255, green: 14/255, blue: 30/255)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {

                    Text("My Art Journal")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)

                    Text("Your personal sketchbooks")
                        .foregroundColor(.white.opacity(0.6))

                    ScrollView {
                        VStack(spacing: 20) {

                            // ✅ UNLOCKED BOOK
                            NavigationLink {
                                JournalBookView()
                            } label: {
                                BookStyleCard(
                                    title: "Spiral Sketchbook",
                                    subtitle: "Practice & drafts",
                                    unlocked: true
                                )
                            }
                            .buttonStyle(.plain)

                            // 🔒 LOCKED
                            BookStyleCard(
                                title: "Folk Art Journal",
                                subtitle: "Traditional works",
                                unlocked: false
                            )

                            BookStyleCard(
                                title: "Museum Archive",
                                subtitle: "Curated collection",
                                unlocked: false
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
}
