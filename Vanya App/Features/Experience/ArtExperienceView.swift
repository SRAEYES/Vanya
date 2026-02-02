//
//  ArtExperienceView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

@available(iOS 18.0, *)
struct ArtExperienceView: View {

    var body: some View {
        List {
            NavigationLink("✏️ Guided Art Canvas") {
                TraceCanvasView()
            }

            NavigationLink("🧩 Cultural Puzzle") {
                PuzzleView()
            }

            NavigationLink("📔 Art Journal") {
                JournalView()
            }
        }
        .navigationTitle("Kalamkari")
    }
}
