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
                .fill(Color.red)
                .frame(width: 14, height: 40)

            Triangle()
                .fill(Color.red)
                .frame(width: 14, height: 10)
        }
        .shadow(radius: 4)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: rect.midX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}
