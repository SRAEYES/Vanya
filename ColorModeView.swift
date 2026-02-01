//
//  ColorModeView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct ColorModeView: View {

    @State private var filled = false

    var body: some View {
        ZStack {

            Color.white.ignoresSafeArea()

            Image("kalamkari_color")
                .resizable()
                .scaledToFit()

            VStack {
                Spacer()

                // 🎨 Palette
                HStack(spacing: 16) {
                    ColorCircle(color: .red) { filled = true }
                    ColorCircle(color: .brown) { filled = true }
                    ColorCircle(color: .black) { filled = true }
                }
                .padding()
            }
        }
    }
}

struct ColorCircle: View {

    let color: Color
    let action: () -> Void

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 36, height: 36)
            .onTapGesture {
                action()
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
    }
}
