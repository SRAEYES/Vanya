//
//  TraceCanvasView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct TraceCanvasView: View {

    @State private var points: [CGPoint] = []

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            Path { path in
                guard let first = points.first else { return }
                path.move(to: first)
                for point in points {
                    path.addLine(to: point)
                }
            }
            .stroke(Color.orange, lineWidth: 4)
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    points.append(value.location)
                }
        )
        .navigationTitle("Trace the Art")
    }
}
