//
//  GuidedArtCanvasView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct GuidedArtCanvasView: View {

    @State private var mode: CanvasMode = .trace

    var body: some View {
        VStack(spacing: 0) {

            // 🔘 Mode Selector
            HStack {
                ModeButton(title: "Trace", selected: mode == .trace) {
                    mode = .trace
                }

                ModeButton(title: "Color", selected: mode == .color) {
                    mode = .color
                }
            }
            .padding()

            Divider()

            // 🎨 Canvas Area
            ZStack {
                if mode == .trace {
                    TraceModeView()
                } else {
                    ColorModeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("Create Art")
        .navigationBarTitleDisplayMode(.inline)
    }
}

enum CanvasMode {
    case trace
    case color
}

struct ModeButton: View {

    let title: String
    let selected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(selected ? .white : .gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(
                    Capsule()
                        .fill(selected ? Color.blue : Color.clear)
                )
        }
    }
}
