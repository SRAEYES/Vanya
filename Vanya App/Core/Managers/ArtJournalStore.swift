//
//  ArtJournalStore.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI
import UIKit

struct JournalEntry: Identifiable {
    let id = UUID()
    let title: String
    let image: UIImage
    let isCompleted: Bool
    let date: Date
}

class ArtJournalStore: ObservableObject {

    @MainActor static let shared = ArtJournalStore()

    @Published var entries: [JournalEntry] = []

    private init() {}

    func save(title: String, image: UIImage, completed: Bool) {
        let entry = JournalEntry(
            title: title,
            image: image,          
            isCompleted: completed,
            date: Date()
        )
        entries.append(entry)
    }
}
