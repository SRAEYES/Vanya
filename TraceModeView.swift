//
//  TraceModeView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct TraceModeView: View {

    @State private var showConfetti = false
    @ObservedObject private var journal = ArtJournalStore.shared

    // User drawing
    @State private var tracedPoints: [CGPoint] = []
    @State private var saved = false
    @State private var showCompletionMessage = false

    // Completion
    @State private var completed = false

    // Glow animation
    @State private var glow = false

    var body: some View {
        ZStack {

            // Background
            Color.white.ignoresSafeArea()

            // 💾 SAVE BUTTON (TOP-RIGHT)
            VStack {
                HStack {
                    Spacer()

                    Button {
                        saveArtwork()
                    } label: {
                        Text(saved ? "Saved ✓" : "Save")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(saved ? Color.green.opacity(0.2) : Color.blue)
                            )
                            .foregroundColor(saved ? .green : .white)
                    }
                    .disabled(saved)
                    .padding(.trailing, 16)
                    .padding(.top, 12)
                }

                Spacer()
            }

            // 🌟 Glowing outline (guide)
            Image("kalamkari_outline")
                .resizable()
                .scaledToFit()
                .opacity(0.45)
                .overlay(
                    Image("kalamkari_outline")
                        .resizable()
                        .scaledToFit()
                        .blur(radius: glow ? 6 : 2)
                        .opacity(glow ? 0.6 : 0.3)
                )

            // ✏️ User trace path
            Path { path in
                guard let first = tracedPoints.first else { return }
                path.move(to: first)
                for point in tracedPoints {
                    path.addLine(to: point)
                }
            }
            .stroke(Color.orange, lineWidth: 4)
            
            if showConfetti {
                SubtleConfettiView()
                    .allowsHitTesting(false)
            }

            // ✅ Completion message (auto hides)
            if showCompletionMessage {
                Text("Artwork Completed ✨")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(14)
                    .transition(.opacity)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    if isValidTrace(point: value.location) {
                        tracedPoints.append(value.location)

                        if !completed && tracedPoints.count > 180 {
                            completeArtwork()
                        }
                    }
                }
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 1.8).repeatForever()) {
                glow.toggle()
            }
        }
    }

    // 🎯 Simple accuracy check
    func isValidTrace(point: CGPoint) -> Bool {
        let screen = UIScreen.main.bounds

        let validX = point.x > screen.width * 0.15 &&
                     point.x < screen.width * 0.85

        let validY = point.y > screen.height * 0.2 &&
                     point.y < screen.height * 0.8

        return validX && validY
    }

    // 🎉 Completion logic
    func completeArtwork() {
        guard !completed else { return }
        completed = true
        showCompletionMessage = true
        showConfetti = true

        UIImpactFeedbackGenerator(style: .medium).impactOccurred()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            showConfetti = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showCompletionMessage = false
            }
        }
    }


    // 💾 Save logic
    func saveArtwork() {
        saved = true
        journal.save(
            title: "Kalamkari Art",
            completed: completed
        )
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

}
