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

            // 📄 Base paper background (full screen)
            Color(white: 0.95)
                .ignoresSafeArea()

            Image("paper_texture")
                .resizable()
                .scaledToFill()
                .opacity(0.25)
                .ignoresSafeArea()

            // 🧵 Bookmark ribbon (only if completed)
            if entry.isCompleted {
                VStack {
                    HStack {
                        Spacer()
                        RibbonView()
                            .padding(.top, 12)
                            .padding(.trailing, 24)
                    }
                    Spacer()
                }
                .zIndex(2)
            }

            // 🖼️ Artwork + metadata
            VStack(spacing: 18) {

                Spacer()

                Image(uiImage: entry.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(
                        color: .black.opacity(0.25),
                        radius: 16,
                        x: 6,
                        y: 6
                    )

                metadata

                Spacer()
            }
            .padding(32)
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
