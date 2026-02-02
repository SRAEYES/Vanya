//
//  RegionHotspot.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct RegionHotspot: View {

    let title: String
    let unlocked: Bool
    let offset: CGSize

    @State private var animateUnlock = false
    @State private var pulse = false

    var body: some View {
        Group {
            if unlocked {
                NavigationLink {
                    MuseumEntryView()
                } label: {
                    hotspot
                }
            } else {
                hotspot
                    .overlay {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    .opacity(0.5)
            }
        }
        .offset(offset)
        .onAppear {
            if unlocked {
                // Step 1: unlock animation
                withAnimation(.easeOut(duration: 0.6)) {
                    animateUnlock = true
                }

                // Step 2: pulse animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    pulse = true
                }

                // Step 3: haptic feedback
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }

    private var hotspot: some View {
        Circle()
            .fill(unlocked ? Color.green.opacity(0.8) : Color.gray.opacity(0.6))
            .frame(width: animateUnlock ? 44 : 0,
                   height: animateUnlock ? 44 : 0)
            .scaleEffect(pulse ? 1.1 : 1)
            .shadow(color: unlocked ? .green.opacity(0.6) : .clear,
                    radius: 8)
            .overlay {
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .animation(
                unlocked ? .easeInOut(duration: 1).repeatForever() : .default,
                value: pulse
            )
    }
}
