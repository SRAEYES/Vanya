//
//  SplashView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

@available(iOS 18.0, *)
struct SplashView: View {
    @State private var startApp = false
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // MARK: - 1. Animated Mesh Background
            // Creates a premium, liquid-like atmosphere
            MeshGradient(width: 3, height: 3, points: [
                [0, 0], [0.5, 0], [1, 0],
                [0, 0.5], [isAnimating ? 0.2 : 0.8, isAnimating ? 0.8 : 0.2], [1, 0.5],
                [0, 1], [0.5, 1], [1, 1]
            ], colors: [
                Color(red: 0.03, green: 0.05, blue: 0.12), .black, Color(red: 0.05, green: 0.1, blue: 0.2),
                .black, Color(red: 0.08, green: 0.12, blue: 0.3), .black,
                Color(red: 0.03, green: 0.05, blue: 0.12), .black, .black
            ])
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
                    isAnimating = true
                }
            }
            
            // MARK: - 2. Choreographed Content
            VStack(spacing: 30) {
                // Peacock Logo with Phase Animation
                PhaseAnimator([0, 1]) { phase in
                    Image("peacock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130)
                        .scaleEffect(phase == 1 ? 1 : 0.8)
                        .blur(radius: phase == 1 ? 0 : 10)
                        .shadow(color: .orange.opacity(0.3 * phase), radius: 20)
                } animation: { phase in
                    .spring(duration: 2, bounce: 0.4)
                }

                VStack(spacing: 8) {
                    // Title with Shimmer and Gradient
                    Text("Vanya")
                        .font(.system(size: 54, weight: .bold, design: .serif))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.orange, .white, .mint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        // This makes the text "pop" from the screen
                        .shadow(color: .black.opacity(0.5), radius: 10, y: 10)
                        .phaseAnimator([0, 1]) { content, phase in
                            content
                                .opacity(phase)
                                .offset(y: phase == 1 ? 0 : 20)
                        } animation: { phase in
                            .easeInOut(duration: 4).delay(0.3)
                        }
                    
                    Text("AN ARTISTIC ODYSSEY")
                        .font(.system(size: 12, weight: .black))
                        .tracking(5)
                        .foregroundColor(.white.opacity(0.4))
                        .phaseAnimator([0, 1]) { content, phase in
                            content.opacity(phase)
                        } animation: { phase in
                            .easeInOut(duration: 4).delay(0.6)
                        }
                }
            }
            
            // MARK: - 3. Loading Micro-interaction
            VStack {
                Spacer()
                Capsule()
                    .fill(Color.white.opacity(0.1))
                    .frame(width: 100, height: 4)
                    .overlay(
                        Capsule()
                            .fill(LinearGradient(colors: [.orange, .mint], startPoint: .leading, endPoint: .trailing))
                            .frame(width: isAnimating ? 100 : 0)
                            .animation(.easeInOut(duration: 2).delay(0.5), value: isAnimating)
                    )
                    .padding(.bottom, 50)
            }
        }
        .onAppear {
            // Seamlessly transition to HomeView
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    startApp = true
                }
            }
        }
        .fullScreenCover(isPresented: $startApp) {
            HomeView()
        }
    }
}

// MARK: - 4. Smooth Transition Extension
extension View {
    // Custom transition to make the HomeView "slide up" elegantly
    func homeTransition() -> some View {
        self.transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

