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
