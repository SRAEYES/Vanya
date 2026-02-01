//
//  ArtJournalStore.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

// One saved artwork
struct JournalEntry: Identifiable {
    let id = UUID()
    let title: String
    let isCompleted: Bool
    let date: Date
}

// Shared store (simple & safe)
class ArtJournalStore: ObservableObject {
    @MainActor static let shared = ArtJournalStore()

    @Published var entries: [JournalEntry] = []

    func save(title: String, completed: Bool) {
        let entry = JournalEntry(
            title: title,
            isCompleted: completed,
            date: Date()
        )
        entries.insert(entry, at: 0)
    }
}
