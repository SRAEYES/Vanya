//
//  StickyGalleryHeader.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

//import SwiftUI
//
//struct StickyGalleryHeader: View {
//
//    var body: some View {
//        HStack(alignment: .top) {
//
//            // 🏷️ Title Section
//            VStack(alignment: .leading, spacing: 6) {
//                Text("South India")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//
//                Text("Art & Folk Traditions")
//                    .font(.subheadline)
//                    .foregroundColor(.white.opacity(0.7))
//            }
//
//            Spacer()
//
//            // 📔 Journal Button
//            NavigationLink {
//                JournalView()
//            } label: {
//                Image(systemName: "book.closed.fill")
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .background(
//                        Circle()
//                            .fill(Color.white.opacity(0.12))
//                    )
//            }
//            .accessibilityLabel("Open Art Journal")
//        }
//        .padding(.horizontal, 20)
//        .padding(.top, 24)   // safe for Dynamic Island
//        .padding(.bottom, 12)
//        .frame(maxWidth: .infinity)
//    }
//}


import SwiftUI

struct StickyGalleryHeader: View {

    var body: some View {
        HStack(alignment: .top) {

            // 🏷️ Title
            VStack(alignment: .leading, spacing: 6) {
                Text("South India")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Art & Folk Traditions")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }

            Spacer()

            // 🧩 Puzzle Button
            NavigationLink {
                PuzzleView()
            } label: {
                Image(systemName: "square.grid.2x2")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.12))
                    )
            }
            .accessibilityLabel("Play Puzzle")

            // 📔 Journal Button
            NavigationLink {
                JournalView()
            } label: {
                Image(systemName: "book.closed.fill")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.12))
                    )
            }
            .accessibilityLabel("Open Art Journal")
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .padding(.bottom, 12)
        .frame(maxWidth: .infinity)
    }
}
