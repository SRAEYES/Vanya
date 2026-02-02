//
//  EmptyJournalPage.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct EmptyJournalPage: View {

    var body: some View {
        VStack(spacing: 20) {

            Spacer()

            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.15))
                .frame(height: 300)
                .overlay(
                    VStack(spacing: 12) {
                        Image(systemName: "book.closed.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)

                        Text("This sketchbook is empty")
                            .font(.headline)
                            .foregroundColor(.white)

                        Text("Create your first artwork to begin")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                )

            Spacer()
        }
        .padding()
    }
}
