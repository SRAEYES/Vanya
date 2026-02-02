//
//  JournalCard.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct JournalCard: View {

    let entry: JournalEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            Text(entry.title)
                .font(.headline)

            Text(entry.isCompleted ? "Completed Artwork" : "Draft")
                .font(.caption)
                .foregroundColor(entry.isCompleted ? .green : .orange)

            Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.06))
        )
    }
}
