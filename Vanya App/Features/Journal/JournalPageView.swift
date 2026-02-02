//
//  JournalPageView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct JournalPageView: View {

    let entry: JournalEntry

    var body: some View {
        ZStack {

            // 📄 Base paper background
            Color(white: 0.95)
                .ignoresSafeArea()

            Image("paper_texture")
                .resizable()
                .scaledToFill()
                .opacity(0.25)
                .ignoresSafeArea()

            // 🧵 Bookmark ribbon
            if entry.isCompleted {
                VStack {
                    HStack {
                        Spacer()
                        RibbonView()
                            .padding(.top, -4)
                            .padding(.trailing, 36)
                    }
                    Spacer()
                }
                .zIndex(3)
            }

            // 📖 Page content
            VStack(spacing: 18) {

                Spacer()

                // 🖼️ ART PRINT AREA (CENTERED)
                ZStack {
                    GeometryReader { geo in
                        Image(uiImage: entry.image)
                            .resizable()
                            .aspectRatio(
                                entry.image.size.width / entry.image.size.height,
                                contentMode: .fit
                            )
                            .frame(
                                maxWidth: geo.size.width * 0.75,
                                maxHeight: geo.size.height * 0.6
                            )
                            .shadow(
                                color: .black.opacity(0.25),
                                radius: 14,
                                x: 4,
                                y: 4
                            )
                            .position(
                                x: geo.size.width / 2,
                                y: geo.size.height / 2
                            )
                    }
                }
                .frame(height: 420)

                metadata

                Spacer()
            }
            .padding(.leading, 72)    // spiral space
            .padding(.trailing, 32)
            .padding(.vertical, 32)
            .overlay(
                LinearGradient(
                    colors: [
                        Color.black.opacity(0.08),
                        Color.clear
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
        }
    }

    // ✍️ Handwritten metadata
    private var metadata: some View {
        VStack(spacing: 6) {
            Text(entry.isCompleted ? "Completed Artwork" : "Draft")
                .font(.custom("BradleyHandITCTT-Bold", size: 14))
                .foregroundColor(.black.opacity(0.6))

            Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                .font(.custom("BradleyHandITCTT-Bold", size: 12))
                .foregroundColor(.black.opacity(0.45))
        }
    }
}
