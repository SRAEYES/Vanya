//
//  JournalCoverView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct JournalCoverView: View {

    var body: some View {
        ZStack {

            // Cover background
            LinearGradient(
                colors: [
                    Color(red: 70/255, green: 45/255, blue: 30/255),
                    Color(red: 40/255, green: 25/255, blue: 15/255)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Texture
            Image("leather_texture")
                .resizable()
                .scaledToFill()
                .opacity(0.25)
                .ignoresSafeArea()

            VStack(spacing: 20) {

                Spacer()

                Text("My Art Journal")
                    .font(.system(size: 36, weight: .bold, design: .serif))
                    .foregroundColor(.white)

                Text("A personal collection of traces & colors")
                    .font(.callout)
                    .foregroundColor(.white.opacity(0.7))

                Spacer()

                Text("Swipe to open →")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.bottom, 40)
            }
        }
    }
}
