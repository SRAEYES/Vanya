//
//  StickyGalleryHeader.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//


import SwiftUI

@available(iOS 18.0, *)
//struct StickyGalleryHeader: View {
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//
//            // 🌸 Motif background (FULL WIDTH)
////            Image("motif_kalamkari")
////                .resizable()
////                .scaledToFill()
////                .opacity(0.04)
////                .frame(height: 80)
////                .clipped()
////                .allowsHitTesting(false)
////                .padding(.horizontal, 20)   // ✅ LEFT & RIGHT SPACE (KEY)
////                .padding(.vertical, 10)
//
//            // 🔹 CONTENT (INSET)
//            HStack {
//
//                // 🏷️ Title
//                VStack(alignment: .leading, spacing: 2) {
//                    Text("South India")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//
//                    Text("Art & Folk Traditions")
//                        .font(.caption)
//                        .foregroundColor(.white.opacity(0.65))
//                }
//
//                Spacer()
//
//                // 🧩 Puzzle Button
//                NavigationLink {
//                    PuzzleView()
//                } label: {
//                    Image(systemName: "square.grid.2x2")
//                        .font(.body)
//                        .foregroundColor(.white)
//                        .padding(8)
//                        .background(
//                            Circle()
//                                .fill(Color.white.opacity(0.12))
//                        )
//                }
//
//                // 📔 Journal Button
//                NavigationLink {
//                    JournalView()
//                } label: {
//                    Image(systemName: "book.closed.fill")
//                        .font(.body)
//                        .foregroundColor(.white)
//                        .padding(8)
//                        .background(
//                            Circle()
//                                .fill(Color.white.opacity(0.12))
//                        )
//                }
//            }
//            .padding(.horizontal, 20)   // ✅ LEFT & RIGHT SPACE (KEY)
//            .padding(.vertical, 10)
//        }
//        .frame(maxWidth: .infinity)
//    }
//}


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
