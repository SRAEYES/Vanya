//
//  TraceModeView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

//import SwiftUI
//
//struct TraceModeView: View {
//
//    @State private var showConfetti = false
//    @ObservedObject private var journal = ArtJournalStore.shared
//
//    // User drawing
//    @State private var tracedPoints: [CGPoint] = []
//    @State private var saved = false
//    @State private var showCompletionMessage = false
//
//    // Completion
//    @State private var completed = false
//
//    // Glow animation
//    @State private var glow = false
//
//    var body: some View {
//        ZStack {
//
//            // Background
//            Color.white.ignoresSafeArea()
//
//            // 💾 SAVE BUTTON (TOP-RIGHT)
//            VStack {
//                HStack {
//                    Spacer()
//
//                    Button {
//                        saveArtwork()
//                    } label: {
//                        Text(saved ? "Saved ✓" : "Save")
//                            .font(.subheadline)
//                            .fontWeight(.medium)
//                            .padding(.horizontal, 14)
//                            .padding(.vertical, 8)
//                            .background(
//                                Capsule()
//                                    .fill(saved ? Color.green.opacity(0.2) : Color.blue)
//                            )
//                            .foregroundColor(saved ? .green : .white)
//                    }
//                    .disabled(saved)
//                    .padding(.trailing, 16)
//                    .padding(.top, 12)
//                }
//
//                Spacer()
//            }
//
//            // 🌟 Glowing outline (guide)
//            Image("kalamkari_outline")
//                .renderingMode(.template)
//                .resizable()
//                .scaledToFit()
//                .foregroundColor(.black)
//                .opacity(0.75)
//                .padding(24)
//
//
//                .overlay(
//                    Image("kalamkari_outline")
//                        .resizable()
//                        .scaledToFit()
//                        .blur(radius: glow ? 6 : 2)
//                        .opacity(glow ? 0.6 : 0.3)
//                )
//
//            // ✏️ User trace strokes
//                        Path { path in
//                            guard let first = tracedPoints.first else { return }
//                            path.move(to: first)
//                            for point in tracedPoints {
//                                path.addLine(to: point)
//                            }
//                        }
//                        .stroke(Color.black, lineWidth: 2)  // thin for tracing
//
//            if showConfetti {
//                SubtleConfettiView()
//                    .allowsHitTesting(false)
//            }
//
//            // ✅ Completion message (auto hides)
//            if showCompletionMessage {
//                Text("Artwork Completed ✨")
//                    .font(.headline)
//                    .foregroundColor(.green)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    .cornerRadius(14)
//                    .transition(.opacity)
//            }
//        }
//        .gesture(
//            DragGesture(minimumDistance: 0)
//                .onChanged { value in
//                    if isValidTrace(point: value.location) {
//                        tracedPoints.append(value.location)
//
//                        if !completed && tracedPoints.count > 180 {
//                            completeArtwork()
//                        }
//                    }
//                }
//        )
//        .onAppear {
//            withAnimation(.easeInOut(duration: 1.8).repeatForever()) {
//                glow.toggle()
//            }
//        }
//    }
//
//    // 🎯 Simple accuracy check
//    func isValidTrace(point: CGPoint) -> Bool {
//        let screen = UIScreen.main.bounds
//
//        let validX = point.x > screen.width * 0.15 &&
//                     point.x < screen.width * 0.85
//
//        let validY = point.y > screen.height * 0.2 &&
//                     point.y < screen.height * 0.8
//
//        return validX && validY
//    }
//
//    // 🎉 Completion logic
//    func completeArtwork() {
//        guard !completed else { return }
//        completed = true
//        showCompletionMessage = true
//        showConfetti = true
//
//        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            showConfetti = false
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            withAnimation {
//                showCompletionMessage = false
//            }
//        }
//    }
//
//
//    // 💾 Save logic
//    func saveArtwork() {
//        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//        // For now: save inside app (no Photos access)
//        print("Artwork saved to journal")
//    }
//
//}


//
//  TraceModeView.swift
//  SwiftStudentChalleneg
//
//  Therapeutic tracing experience
//

//
//  TraceModeView.swift
//  SwiftStudentChalleneg
//
//  Refined therapeutic tracing
//

import SwiftUI

struct TraceModeView: View {

    @Environment(\.dismiss) var dismiss
    @State private var showConfetti = false
    @ObservedObject private var journal = ArtJournalStore.shared

    @State private var tracedPoints: [CGPoint] = []
    @State private var saved = false
    @State private var showCompletionMessage = false
    @State private var completed = false
    @State private var glow = false
    @State private var progress: Double = 0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.99, green: 0.98, blue: 0.96),
                    Color(red: 0.96, green: 0.95, blue: 0.93)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                // Minimal Header
                HStack(spacing: 16) {
                    Button {
                        dismiss()
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
                            )
                    }
                    
                    Spacer()
                    
                    // Progress
                    HStack(spacing: 8) {
                        ProgressView(value: progress, total: 100)
                            .tint(.orange)
                            .frame(width: 80)
                        
                        Text("\(Int(progress))%")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.orange)
                            .frame(width: 40)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .fill(.ultraThinMaterial)
                    )
                    
                    Spacer()
                    
                    Button {
                        saveArtwork()
                    } label: {
                        Image(systemName: saved ? "checkmark.circle.fill" : "arrow.down.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: saved ? [.green, .mint] : [.orange, .orange.opacity(0.8)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .shadow(color: (saved ? Color.green : Color.orange).opacity(0.4), radius: 8, x: 0, y: 2)
                            )
                    }
                    .disabled(saved)
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 8)

                // Canvas
                ZStack {
                    Image("kalamkari_outline")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .opacity(0.6)
                        .padding(20)
                        .scaleEffect(glow ? 1.01 : 1.0)
                        .overlay(
                            Image("kalamkari_outline")
                                .resizable()
                                .scaledToFit()
                                .blur(radius: glow ? 8 : 3)
                                .opacity(glow ? 0.4 : 0.2)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.orange, .orange.opacity(0.6)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .padding(20)
                        )

                    Canvas { context, size in
                        guard !tracedPoints.isEmpty else { return }
                        
                        var path = Path()
                        path.move(to: tracedPoints[0])
                        for point in tracedPoints.dropFirst() {
                            path.addLine(to: point)
                        }
                        
                        context.stroke(
                            path,
                            with: .linearGradient(
                                Gradient(colors: [.orange, .orange.opacity(0.7)]),
                                startPoint: .zero,
                                endPoint: CGPoint(x: size.width, y: size.height)
                            ),
                            lineWidth: 3
                        )
                    }

                    if showConfetti {
                        PremiumConfettiView()
                            .allowsHitTesting(false)
                    }

                    if showCompletionMessage {
                        VStack(spacing: 10) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 50))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.green, .mint],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                            
                            Text("Complete!")
                                .font(.title3.weight(.semibold))
                                .foregroundColor(.black.opacity(0.8))
                        }
                        .padding(24)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .shadow(color: .green.opacity(0.2), radius: 20)
                        )
                        .transition(.scale.combined(with: .opacity))
                    }
                }
                .frame(maxHeight: .infinity)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    if isValidTrace(point: value.location) {
                        tracedPoints.append(value.location)
                        progress = min(Double(tracedPoints.count) / 180.0 * 100, 100)

                        if !completed && tracedPoints.count > 180 {
                            completeArtwork()
                        }
                        
                        if tracedPoints.count % 40 == 0 {
                            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                        }
                    }
                }
        )
        .navigationBarHidden(true)
        .onAppear {
            withAnimation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true)) {
                glow.toggle()
            }
        }
    }

    func isValidTrace(point: CGPoint) -> Bool {
        let screen = UIScreen.main.bounds
        return point.x > screen.width * 0.15 && point.x < screen.width * 0.85 &&
               point.y > screen.height * 0.2 && point.y < screen.height * 0.8
    }

    func completeArtwork() {
        guard !completed else { return }
        completed = true
        
        withAnimation(.spring(response: 0.5)) {
            showCompletionMessage = true
            showConfetti = true
        }

        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            showConfetti = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation {
                showCompletionMessage = false
            }
        }
    }

    func saveArtwork() {
        withAnimation(.spring(response: 0.3)) {
            saved = true
        }
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
}

struct PremiumConfettiView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            ForEach(0..<25) { index in
                ConfettiPiece()
                    .offset(y: animate ? 700 : -50)
                    .opacity(animate ? 0 : 1)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2)) {
                animate = true
            }
        }
    }
}

struct ConfettiPiece: View {
    @State private var rotation: Double = 0
    let colors: [Color] = [.orange, .yellow, .mint, .pink, .green]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(colors.randomElement() ?? .orange)
            .frame(width: 8, height: 12)
            .rotationEffect(.degrees(rotation))
            .offset(x: CGFloat.random(in: -150...150))
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}
