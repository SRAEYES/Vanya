//
//  MuseumArtCard.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct MuseumArtCard: View {

    let image: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 16) {

            // 🖼️ Artwork thumbnail (controlled size)
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 88, height: 110)
                .clipped()
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 6) {

                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))

                Spacer()

                Text("Experience →")
                    .font(.caption2)
                    .foregroundColor(.blue.opacity(0.8))
            }

            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white.opacity(0.06)) // glassy dark
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(.ultraThinMaterial)
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.white.opacity(0.08))
        )
        .padding(.horizontal)
    }
}
