//
//  StoryUnlockView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct StoryUnlockView: View {

    var body: some View {
        ZStack {

            LinearGradient(
                colors: [
                    Color(red: 8/255, green: 12/255, blue: 30/255),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    Text("Kalamkari")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Andhra Pradesh")
                        .foregroundColor(.white.opacity(0.6))

                    Text("""
Kalamkari is a traditional hand-painted textile art from Andhra Pradesh, created using natural dyes on cotton fabric.

The stories depicted often come from the Ramayana and Mahabharata, turning cloth into a narrative medium passed across generations.
""")
                    .foregroundColor(.white)
                    .font(.body)

                }
                .padding()
            }
        }
    }
}
