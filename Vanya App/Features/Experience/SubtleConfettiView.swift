//
//  SubtleConfettiView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct SubtleConfettiView: View {

    @State private var animate = false

    var body: some View {
        ZStack {
            ForEach(0..<12, id: \.self) { i in
                Circle()
                    .fill(Color.orange.opacity(0.6))
                    .frame(width: 6, height: 6)
                    .offset(
                        x: CGFloat.random(in: -120...120),
                        y: animate ? -200 : 0
                    )
                    .opacity(animate ? 0 : 1)
                    .animation(
                        .easeOut(duration: 1.2)
                            .delay(Double(i) * 0.03),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}
