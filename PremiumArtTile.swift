//
//  PremiumArtTile.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct PremiumArtTile: View {

    let image: String
    let title: String
    let subtitle: String

    @State private var liked = false
    @State private var saved = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            // 🖼️ Image → Guided Art Canvas
            NavigationLink {
                GuidedArtCanvasView()
            } label: {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 140)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(Color.white.opacity(0.08))
                    )
                    .shadow(radius: 4)
            }
            .buttonStyle(.plain)

            // 🏷️ Text
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }

            // 🧩 Puzzle Action
//            NavigationLink {
//                PuzzleView()
//            } label: {
//                Text("Play Puzzle")
//                    .font(.caption)
//                    .fontWeight(.medium)
//                    .foregroundColor(.blue)
//            }

            // ❤️ Community Actions
            HStack(spacing: 16) {

                Button {
                    liked.toggle()
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                } label: {
                    Image(systemName: liked ? "heart.fill" : "heart")
                        .foregroundColor(liked ? .red : .white.opacity(0.7))
                }

                Button {
                    share()
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white.opacity(0.7))
                }

                Button {
                    saved.toggle()
                } label: {
                    Image(systemName: saved ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.white.opacity(0.7))
                }

                Spacer()
            }
            .font(.caption)
            .padding(.top, 4)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white.opacity(0.06))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.white.opacity(0.08))
        )
    }

    // 📤 Share (System Share Sheet)
    private func share() {
        let text = "Exploring \(title) art on Vanya 🌿"
        let activityVC = UIActivityViewController(
            activityItems: [text],
            applicationActivities: nil
        )

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let root = scene.windows.first?.rootViewController {
            root.present(activityVC, animated: true)
        }
    }
}
