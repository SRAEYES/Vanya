//
//  MuseumEntryView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

@available(iOS 18.0, *)
struct MuseumEntryView: View {

    @State private var zoomIn = false
    @State private var fadeOut = false
    @State private var goNext = false

    var body: some View {
        ZStack {

            // 🌌 Full black background
            Color.black
                .ignoresSafeArea(.all)

            // 🏛️ Corridor image — FULL SCREEN
            Image("museum_corridor")
                .resizable()
                .scaledToFill()
                .clipped()

                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .scaleEffect(zoomIn ? 1.08 : 1.0)
                .opacity(fadeOut ? 0 : 1)
                .ignoresSafeArea(.all)

            // 📝 Bottom text
            VStack {
                Spacer()
                Text("Entering South India")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.75))
                    .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden(true) // 🚫 no back button
        .navigationBarHidden(true)            // 🚫 no nav bar
        .onAppear {

            // 🚪 Door haptic
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()

            // 🚶 Start footsteps
            SoundManager.shared.playFootsteps()

            // 🎥 Slow walk
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.easeInOut(duration: 3.5)) {
                    zoomIn = true
                }
            }

            // 🌫️ Fade out
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.4) {
                withAnimation(.easeOut(duration: 1.2)) {
                    fadeOut = true
                }
            }

            // ➡️ Move to gallery
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.6) {
                SoundManager.shared.stopFootsteps()
                goNext = true
            }
        }

        .fullScreenCover(isPresented: $goNext) {
            SouthIndiaArtView()
        }
    }
}
