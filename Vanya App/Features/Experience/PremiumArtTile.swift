//
//  PremiumArtTile.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

@available(iOS 17.0, *)
struct PremiumArtTile: View {
    let image: String
    let title: String
    let subtitle: String

    @State private var liked = false
    @State private var saved = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // IMAGE → OPENS CREATE ART VIEW
            NavigationLink(destination: CreateArtView()) {
                ZStack {
                    // Frame for the image
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(8) // Beautiful inset frame look
            }
            .buttonStyle(PlainButtonStyle())

            // TEXT & COMMUNITY ACTIONS
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(.subheadline, design: .serif, weight: .bold))
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(1)

                    Text(subtitle.uppercased())
                        .font(.system(size: 9, weight: .black))
                        .tracking(1)
                        .foregroundColor(.white.opacity(0.4))
                }
                
                // ACTION BAR
                HStack(spacing: 18) {
                    Button {
                        liked.toggle()
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    } label: {
                        Image(systemName: liked ? "heart.fill" : "heart")
                            .foregroundColor(liked ? .red : .white.opacity(0.5))
                    }

                    Button { share() } label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.white.opacity(0.5))
                    }

                    Button {
                        saved.toggle()
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    } label: {
                        Image(systemName: saved ? "bookmark.fill" : "bookmark")
                            .foregroundColor(saved ? .white : .white.opacity(0.5))
                    }
                }
                .font(.system(size: 14))
            }
            .padding([.horizontal, .bottom], 14)
            .padding(.top, 2)
        }
        // THE LIQUID GLASS EFFECT
        .background(.ultraThinMaterial.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(LinearGradient(colors: [.white.opacity(0.4), .clear], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 0.5)
        )
    }

    private func share() {
        let text = "Exploring \(title) art on Vanya 🌿"
        let activityVC = UIActivityViewController(activityItems: [text], applicationActivities: nil)

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let root = scene.windows.first?.rootViewController {
            root.present(activityVC, animated: true)
        }
    }
}
