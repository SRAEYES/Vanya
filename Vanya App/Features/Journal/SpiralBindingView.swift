//
//  SpiralBindingView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct SpiralBindingView: View {

    let ringCount: Int = 14

    var body: some View {
        VStack(spacing: 14) {
            ForEach(0..<ringCount, id: \.self) { _ in
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color.black.opacity(0.4),
                                Color.white.opacity(0.6)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
                    .frame(width: 14, height: 14)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.05))
                    )
            }
        }
        .padding(.leading, 10)
        .padding(.vertical, 40)
        .background(
            LinearGradient(
                colors: [
                    Color.black.opacity(0.15),
                    Color.clear
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }
}
