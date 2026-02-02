//
//  RibbonView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct RibbonView: View {

    var body: some View {
        VStack(spacing: 0) {

            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.red,
                            Color.red.opacity(0.85)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 18, height: 56)

            Triangle()
                .fill(Color.red.opacity(0.9))
                .frame(width: 18, height: 12)
        }
        .shadow(color: .black.opacity(0.35), radius: 4, x: 0, y: 2)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}
