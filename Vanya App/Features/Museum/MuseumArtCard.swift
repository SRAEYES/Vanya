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
        HStack(spacing: 20) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.2), lineWidth: 0.5))
                .shadow(radius: 10)

            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.caption)
                    .lineLimit(2)
                    .foregroundColor(.white.opacity(0.5))

                Spacer()

                HStack {
                    Text("BEGIN EXPERIENCE")
                        .font(.system(size: 10, weight: .black))
                        .tracking(1)
                        .foregroundColor(.orange)
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundStyle(.orange)
                }
            }
            .padding(.vertical, 10)

            Spacer()
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.white.opacity(0.03))
                .background(.ultraThinMaterial)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(LinearGradient(colors: [.white.opacity(0.2), .clear], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}
