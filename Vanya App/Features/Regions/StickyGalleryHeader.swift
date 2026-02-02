//
//  StickyGalleryHeader.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//


import SwiftUI

@available(iOS 18.0, *)
struct StickyGalleryHeader: View {
    var body: some View {
        HStack(alignment: .center) {
            // 🏷️ Title Group
            VStack(alignment: .leading, spacing: 2) {
                Text("South India")
                    .font(.system(size: 26, weight: .bold, design: .serif))
                    .foregroundColor(.white)

                Text("HERITAGE & TRADITIONS")
                    .font(.system(size: 10, weight: .black))
                    .tracking(2)
                    .foregroundColor(.white.opacity(0.4))
            }

            Spacer()

            // 🛠️ Tool Group
            HStack(spacing: 12) {
                HeaderIcon(icon: "square.grid.2x2", destination: PuzzleView())
                HeaderIcon(icon: "book.closed.fill", destination: JournalView())
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 10)
    }
}

// Reusable Circular Glass Button
struct HeaderIcon<Destination: View>: View {
    let icon: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Image(systemName: icon)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white.opacity(0.9))
                .frame(width: 42, height: 42)
                .background(.white.opacity(0.08))
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(.white.opacity(0.1), lineWidth: 0.5)
                )
        }
    }
}
