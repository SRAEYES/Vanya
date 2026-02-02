//
//  MuseumEntryView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

@available(iOS 18.0, *)
struct MuseumEntryView: View {
    @State private var immersionProgress: CGFloat = 0.0
    @State private var ambientGlow: Double = 0.0
    @State private var goNext = false
    
    var body: some View {
        ZStack {
            // 1. PURE BLACK FOUNDATION
            Color.black.ignoresSafeArea()

            // 2. THE CHRONOS CORRIDOR
            Image("museum_corridor")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                // Pro 3D Depth: Scaling up while pushing the Y-axis simulates a high-end camera move
                .scaleEffect(1.0 + (immersionProgress * 0.35))
                .offset(y: immersionProgress * 15)
                .blur(radius: (1.0 - ambientGlow) * 15)
                .overlay(
                    // Instead of a flash, we use a Vignette that tightens as you enter
                    RadialGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(immersionProgress)]),
                        center: .center,
                        startRadius: 100,
                        endRadius: 500
                    )
                )
                .opacity(1.0 - (immersionProgress * 0.8)) // Smoothly dimming into the next scene
                .ignoresSafeArea()

            // 3. MINIMALIST TYPOGRAPHY (The "Curator" Style)
            VStack(spacing: 40) {
                Spacer()
                
                VStack(spacing: 12) {
                    Text("SOUTH INDIA")
                        .font(.system(size: 14, weight: .black))
                        .tracking(12)
                        .foregroundStyle(.orange.gradient)
                        .opacity(ambientGlow)
                    
                    Text("The Dravidian Legacy")
                        .font(.custom("Hoefler Text", size: 32))
                        .italic()
                        .foregroundStyle(.white)
                        .opacity(ambientGlow)
                }
                .offset(y: -immersionProgress * 50) // Text floats "up" as you walk "in"
                .blur(radius: immersionProgress * 5)
                
                // Minimalist Loading Line (The "Horizon" bar)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white.opacity(0.1))
                        .frame(width: 120, height: 1)
                    
                    Rectangle()
                        .fill(LinearGradient(colors: [.clear, .orange, .clear], startPoint: .leading, endPoint: .trailing))
                        .frame(width: immersionProgress * 120, height: 1.5)
                        .shadow(color: .orange.opacity(0.8), radius: 4)
                }
                .opacity(1.0 - immersionProgress)

                Spacer().frame(height: 100)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: executeProfessionalEntry)
        .fullScreenCover(isPresented: $goNext) {
            SouthIndiaArtView()
        }
    }

    private func executeProfessionalEntry() {
        // Initial fade in of text and atmosphere
        withAnimation(.easeOut(duration: 2.0)) {
            ambientGlow = 1.0
        }

        // The "Steady-Cam" Walk-in
        // Using a custom spring for a heavy, physical feeling of movement
        withAnimation(.interpolatingSpring(stiffness: 10, damping: 8).speed(0.15)) {
            immersionProgress = 1.0
        }

        // Precise timing for Haptic feedback (The "Footfall")
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { timer in
            if immersionProgress < 0.9 {
                UIImpactFeedbackGenerator(style: .soft).impactOccurred(intensity: 0.3)
            } else {
                timer.invalidate()
            }
        }

        // Smooth transition to the next view
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            goNext = true
        }
    }
}
