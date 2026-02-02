//
//  HomeView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

@available(iOS 18.0, *)
@available(iOS 17.0, *)

struct HomeView: View {
    @State private var isMapLoaded = false
    @State private var dragOffset = CGSize.zero
    @State private var meshPhase: Float = 0.0 // For animated background
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    // MARK: - 1. ADVANCED ANIMATED MESH GRADIENT
                    // This creates a living, breathing dark atmosphere
                    MeshGradient(width: 3, height: 3, points: [
                        SIMD2<Float>(0.0, 0.0), SIMD2<Float>(0.5, 0.0), SIMD2<Float>(1.0, 0.0),
                        SIMD2<Float>(0.0, 0.5), SIMD2<Float>(meshPhase, 0.5), SIMD2<Float>(1.0, 0.5),
                        SIMD2<Float>(0.0, 1.0), SIMD2<Float>(0.5, 1.0), SIMD2<Float>(1.0, 1.0)
                    ], colors: [
                        Color(hex: "050814"), Color(hex: "080C1E"), Color(hex: "050814"),
                        .black, Color(hex: "14214D"), .black,
                        Color(hex: "080C1E"), .black, Color(hex: "050814")
                    ])
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                            meshPhase = 0.7
                        }
                    }

                    // MARK: - 2. CINEMATIC FULL SCREEN MAP
                    ZStack {
                        // Subtle Glow behind the map
                        Circle()
                            .fill(Color.orange.opacity(0.1))
                            .frame(width: 400, height: 400)
                            .blur(radius: 80)
                            .offset(x: dragOffset.width / 10, y: dragOffset.height / 10)

                        Image("india_map")
                            .resizable()
                            .scaledToFill() // Ensures full screen coverage
                            .frame(width: geo.size.width * 1.1, height: geo.size.height * 0.8)
                            .opacity(isMapLoaded ? 0.95 : 0)
                            .scaleEffect(isMapLoaded ? 1.0 : 0.85)
                            .blur(radius: isMapLoaded ? 0 : 30)
                            
                            // ADVANCED 3D PARALLAX
                            .rotation3DEffect(.degrees(Double(dragOffset.width / 30)), axis: (x: 0, y: 1, z: 0))
                            .rotation3DEffect(.degrees(Double(-dragOffset.height / 30)), axis: (x: 1, y: 0, z: 0))
                            .offset(x: dragOffset.width / 15, y: dragOffset.height / 15)
                            .shadow(color: .black.opacity(0.5), radius: 30, x: -dragOffset.width/5, y: -dragOffset.height/5)
                    }

                    // MARK: - 3. TITLE & NAVIGATION
                    VStack(spacing: 12) {
                        VStack(spacing: 4) {
                            Text("VANYA ART")
                                .font(.system(size: 12, weight: .black))
                                .tracking(10)
                                .foregroundStyle(
                                    LinearGradient(colors: [.orange, .yellow], startPoint: .leading, endPoint: .trailing)
                                )
                            
                            Text("Explore the Heritage")
                                .font(.system(size: 28, weight: .bold, design: .serif))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 60)
                        
                        Spacer()
                        
                        // HOTSPOT LOGIC (Connections maintained)
                        ZStack {
                            // SOUTH (The Active Entry)
                            NavigationLink(destination: MuseumEntryView()) {
                                PremiumRegionPoint(label: "South", isUnlocked: true)
                            }
                            .offset(x: 10, y: geo.size.height * 0.22)

                            PremiumRegionPoint(label: "North", isUnlocked: false)
                                .offset(x: 0, y: -geo.size.height * 0.25)

                            PremiumRegionPoint(label: "West", isUnlocked: false)
                                .offset(x: -geo.size.width * 0.32, y: -geo.size.height * 0.05)

                            PremiumRegionPoint(label: "East", isUnlocked: false)
                                .offset(x: geo.size.width * 0.32, y: -geo.size.height * 0.02)
                        }
                        
                        Spacer()
                        
                        Text("Touch a region to begin")
                            .font(.system(size: 14, weight: .medium, design: .monospaced))
                            .foregroundColor(.white.opacity(0.4))
                            .padding(.bottom, 30)
                    }
                }
                .contentShape(Rectangle())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.interactiveSpring()) {
                                dragOffset = value.translation
                            }
                        }
                        .onEnded { _ in
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                dragOffset = .zero
                            }
                        }
                )
            }
        }
        .onAppear {
            withAnimation(.spring(response: 1.2, dampingFraction: 0.8)) {
                isMapLoaded = true
            }
        }
    }
}

@available(iOS 17.0, *)
struct PremiumRegionPoint: View {
    let label: String
    let isUnlocked: Bool
    
    // Animation States
    @State private var breathingAngle: Double = 0.0
    @State private var particleScale: CGFloat = 1.0
    @State private var particleOpacity: Double = 0.5
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                // 1. DYNAMIC BACKGROUND EFFECTS (Only for Unlocked)
                if isUnlocked {
                    unlockedDecorations
                }
                
                // 2. THE MAIN GLASS LENS
                mainLensBody
            }
            
            // 3. ELEGANT TYPOGRAPHY
            labelSection
        }
        .onAppear(perform: startAnimations)
    }
    
    // MARK: - Sub-Components
    
    private var unlockedDecorations: some View {
        ZStack {
            // Neon Orbit Ring
            Circle()
                .stroke(
                    AngularGradient(
                        colors: [.orange, .yellow.opacity(0.2), .orange, .orange.opacity(0.1)],
                        center: .center,
                        angle: .degrees(breathingAngle)
                    ),
                    lineWidth: 2
                )
                .frame(width: 58, height: 58)
            
            // Pulse Ripple
            Circle()
                .stroke(Color.orange.opacity(0.4), lineWidth: 1)
                .frame(width: 50, height: 50)
                .scaleEffect(particleScale)
                .opacity(particleOpacity)
        }
    }
    
    private var mainLensBody: some View {
        ZStack {
            if isUnlocked {
                // Unlocked: Amber Glow Core
                Circle()
                    .fill(LinearGradient(colors: [.orange, .orange.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 0.5))
                    .shadow(color: .orange.opacity(0.5), radius: 10)
                
                Image(systemName: "sparkles")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .symbolEffect(.variableColor.iterative, options: .repeating)
            } else {
                // Locked: Frosted Dark Glass
                Circle()
                    .fill(.ultraThinMaterial)
                    .brightness(-0.2)
                    .overlay(Circle().stroke(Color.white.opacity(0.1), lineWidth: 0.5))
                
                Image(systemName: "lock.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(.white.opacity(0.3))
            }
        }
        .frame(width: 42, height: 42)
    }
    
    private var labelSection: some View {
        VStack(spacing: 4) {
            Text(label.uppercased())
                .font(.system(size: 10, weight: .black))
                .tracking(3)
                .foregroundStyle(isUnlocked ? .white : .white.opacity(0.4))
            
            if isUnlocked {
                Capsule()
                    .fill(Color.orange)
                    .frame(width: 14, height: 2)
            }
        }
    }
    
    // MARK: - Animation Logic
    private func startAnimations() {
        guard isUnlocked else { return }
        
        withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
            breathingAngle = 360
        }
        
        withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
            particleScale = 1.8
            particleOpacity = 0
        }
    }
}

// MARK: - COLOR HEX HELPER
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6: (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default: (r, g, b) = (1, 1, 1)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: 1)
    }
}
