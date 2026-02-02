//
//  JournalEndView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct JournalEndView: View {

    var body: some View {
        ZStack {

            Color(white: 0.95).ignoresSafeArea()

            Image("paper_texture")
                .resizable()
                .scaledToFill()
                .opacity(0.25)
                .ignoresSafeArea()

            VStack(spacing: 16) {

                Spacer()

                Text("— End of Journal —")
                    .font(.system(size: 22, weight: .medium, design: .serif))
                    .foregroundColor(.black.opacity(0.6))

                Text("Created with care ✍️")
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.4))

                Spacer()
            }
        }
    }
}
