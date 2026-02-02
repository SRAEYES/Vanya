//
//  BookStyleCard.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct BookStyleCard: View {

    let title: String
    let subtitle: String
    let unlocked: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {

                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            Image(systemName: unlocked ? "book.fill" : "lock.fill")
                .foregroundColor(.white.opacity(0.7))
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.08))
        )
        .opacity(unlocked ? 1 : 0.45)
    }
}
