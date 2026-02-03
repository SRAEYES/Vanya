//
//  MuseumEntryView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

//import SwiftUI
//
//@available(iOS 18.0, *)
//struct MuseumEntryView: View {
//    @State private var immersionProgress: CGFloat = 0.0
//    @State private var ambientGlow: Double = 0.0
//    @State private var goNext = false
//    @Environment(\.dismiss) private var dismiss
//
//    var onExit: (() -> Void)? = nil
//    
//    var body: some View {
//        ZStack {
//            // 1. PURE BLACK FOUNDATION
//            Color.black.ignoresSafeArea()
//
//            // 2. THE CHRONOS CORRIDOR
//            Image("museum_corridor")
//                .resizable()
//                .scaledToFill()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                // Pro 3D Depth: Scaling up while pushing the Y-axis simulates a high-end camera move
//                .scaleEffect(1.0 + (immersionProgress * 0.35))
//                .offset(y: immersionProgress * 15)
//                .blur(radius: (1.0 - ambientGlow) * 15)
//                .overlay(
//                    // Instead of a flash, we use a Vignette that tightens as you enter
//                    RadialGradient(
//                        gradient: Gradient(colors: [.clear, .black.opacity(immersionProgress)]),
//                        center: .center,
//                        startRadius: 100,
//                        endRadius: 500
//                    )
//                )
//                .opacity(1.0 - (immersionProgress * 0.8)) // Smoothly dimming into the next scene
//                .ignoresSafeArea()
//
//            // 3. MINIMALIST TYPOGRAPHY (The "Curator" Style)
//            VStack(spacing: 40) {
//                Spacer()
//                
//                VStack(spacing: 12) {
//                    Text("SOUTH INDIA")
//                        .font(.system(size: 14, weight: .black))
//                        .tracking(12)
//                        .foregroundStyle(.orange.gradient)
//                        .opacity(ambientGlow)
//                    
//                    Text("The Dravidian Legacy")
//                        .font(.custom("Hoefler Text", size: 32))
//                        .italic()
//                        .foregroundStyle(.white)
//                        .opacity(ambientGlow)
//                }
//                .offset(y: -immersionProgress * 50) // Text floats "up" as you walk "in"
//                .blur(radius: immersionProgress * 5)
//                
//                // Minimalist Loading Line (The "Horizon" bar)
//                ZStack(alignment: .leading) {
//                    Rectangle()
//                        .fill(.white.opacity(0.1))
//                        .frame(width: 120, height: 1)
//                    
//                    Rectangle()
//                        .fill(LinearGradient(colors: [.clear, .orange, .clear], startPoint: .leading, endPoint: .trailing))
//                        .frame(width: immersionProgress * 120, height: 1.5)
//                        .shadow(color: .orange.opacity(0.8), radius: 4)
//                }
//                .opacity(1.0 - immersionProgress)
//
//                Spacer().frame(height: 100)
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .onAppear(perform: executeProfessionalEntry)
//        .fullScreenCover(isPresented: $goNext, onDismiss: {
//            onExit?()          // 🔥 reset NavigationPath
//            dismiss()          // 🔥 pop MuseumEntryView
//        }) {
//            SouthIndiaArtView()
//        }
//    }
//
//    private func executeProfessionalEntry() {
//        // Initial fade in of text and atmosphere
//        withAnimation(.easeOut(duration: 2.0)) {
//            ambientGlow = 1.0
//        }
//
//        // The "Steady-Cam" Walk-in
//        // Using a custom spring for a heavy, physical feeling of movement
//        withAnimation(.interpolatingSpring(stiffness: 10, damping: 8).speed(0.15)) {
//            immersionProgress = 1.0
//        }
//
//        // Precise timing for Haptic feedback (The "Footfall")
//        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { timer in
//            if immersionProgress < 0.9 {
//                UIImpactFeedbackGenerator(style: .soft).impactOccurred(intensity: 0.3)
//            } else {
//                timer.invalidate()
//            }
//        }
//
//        // Smooth transition to the next view
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            goNext = true
//        }
//    }
//}


import SwiftUI

@available(iOS 18.0, *)
struct MuseumEntryView: View {
    @State private var immersionProgress: CGFloat = 0.0
    @State private var ambientGlow: Double = 0.0
    @State private var goNext = false
    @Environment(\.dismiss) private var dismiss

    var onExit: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            // THE CORRIDOR: Now uses a non-linear opacity curve for a "soft" exit
            Image("museum_corridor")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .scaleEffect(1.0 + (immersionProgress * 0.5)) // More aggressive scale for "passing through"
                .offset(y: immersionProgress * 30)
                .blur(radius: immersionProgress * 20) // Blur increases as you get closer
                .overlay(
                    // Cinematic Vignette that narrows the field of view
                    RadialGradient(
                        gradient: Gradient(colors: [.clear, .black.opacity(immersionProgress)]),
                        center: .center,
                        startRadius: 200 - (immersionProgress * 100),
                        endRadius: 600
                    )
                )
                .opacity(1.0 - (immersionProgress * 0.9)) // Never hits 0 fully until the very last millisecond
                .ignoresSafeArea()

            // TYPOGRAPHY: Elegant lift-off
            VStack(spacing: 40) {
                Spacer()
                
                VStack(spacing: 12) {
                    Text("SOUTH INDIA")
                        .font(.system(size: 14, weight: .black))
                        .tracking(12)
                        .foregroundStyle(.orange.gradient)
                    
                    Text("The Dravidian Legacy")
                        .font(.custom("Hoefler Text", size: 32))
                        .italic()
                        .foregroundStyle(.white)
                }
                .opacity(ambientGlow - (immersionProgress * 1.2))
                .offset(y: -immersionProgress * 80)
                .blur(radius: immersionProgress * 4)
                
                // Horizon Progress Line
                Rectangle()
                    .fill(LinearGradient(colors: [.clear, .orange, .clear], startPoint: .leading, endPoint: .trailing))
                    .frame(width: immersionProgress * 150, height: 1.5)
                    .shadow(color: .orange.opacity(0.6), radius: 4)
                    .opacity(1.0 - immersionProgress)

                Spacer().frame(height: 100)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: executeProfessionalEntry)
        .fullScreenCover(isPresented: $goNext, onDismiss: {
            onExit?()
            dismiss()
        }) {
            SouthIndiaArtView()
        }
    }

    private func executeProfessionalEntry() {
        // 1. Initial Atmosphere (Quick Breath)
        withAnimation(.easeOut(duration: 1.2)) {
            ambientGlow = 1.0
        }

        // 2. The Professional Camera Move
        // We use a slightly faster speed so the momentum stays high
        withAnimation(.easeInOut(duration: 4.8)) {
            immersionProgress = 1.0
        }

        // 3. Precise Haptic "Pulse"
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if immersionProgress < 0.95 {
                UIImpactFeedbackGenerator(style: .light).impactOccurred(intensity: 0.2)
            } else {
                timer.invalidate()
            }
        }

        // 4. THE CROSS-FADE TRIGGER
        // We trigger 'goNext' at 4.6 seconds.
        // Since the animation is 4.8s, the new view arrives exactly as the
        // old one is at its peak blur and 90% transparency.
        // This hides the transition completely.
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.6) {
            goNext = true
        }
    }
}
