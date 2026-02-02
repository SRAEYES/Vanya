//
//  ArtJournalStore.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI
import UIKit

// One saved artwork
//struct JournalEntry: Identifiable {
//    let id = UUID()
//    let title: String
//    let isCompleted: Bool
//    let date: Date
//}

struct JournalEntry: Identifiable {
    let id = UUID()
    let title: String
    let image: UIImage       // ✅ ADD THIS
    let isCompleted: Bool
    let date: Date
}


// Shared store (simple & safe)
//import UIKit
//import SwiftUI

class ArtJournalStore: ObservableObject {

    @MainActor static let shared = ArtJournalStore()

    @Published var entries: [JournalEntry] = []

    private init() {}

    func save(title: String, image: UIImage, completed: Bool) {
        let entry = JournalEntry(
            title: title,
            image: image,          // ✅ STORE IMAGE
            isCompleted: completed,
            date: Date()
        )
        entries.append(entry)
    }
}
