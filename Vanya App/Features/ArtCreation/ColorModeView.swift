//
//  ColorModeView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct ColorModeView: View {

    @State private var selectedColor: Color = .red
    @State private var strokes: [ColoredStroke] = []

    var body: some View {
        ZStack {

            // 🧾 Paper background
            Color(white: 0.96)
                .ignoresSafeArea()

            // 🖼️ Outline (always on top of paper)
            Image("kalamkari_outline")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .opacity(0.7)
                .padding(24)

            // ✏️ User coloring strokes
            ForEach(strokes) { stroke in
                Path { path in
                    guard let first = stroke.points.first else { return }
                    path.move(to: first)
                    for point in stroke.points {
                        path.addLine(to: point)
                    }
                }
                .stroke(stroke.color, lineWidth: 8)   // thicker = coloring feel
            }

            // 🎨 Color palette
            VStack {
                Spacer()
                HStack(spacing: 14) {
                    ForEach([Color.red, .blue, .green, .orange, .brown], id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 34, height: 34)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: selectedColor == color ? 3 : 0)
                            )
                            .onTapGesture {
                                selectedColor = color
                                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                            }
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(16)
                .padding(.bottom, 12)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    if strokes.last?.color == selectedColor {
                        strokes[strokes.count - 1].points.append(value.location)
                    } else {
                        strokes.append(
                            ColoredStroke(
                                color: selectedColor,
                                points: [value.location]
                            )
                        )
                    }
                }
        )
        .navigationTitle("Color Mode")
        .navigationBarTitleDisplayMode(.inline)
    }
}
