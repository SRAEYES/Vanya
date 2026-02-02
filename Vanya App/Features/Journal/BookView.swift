//
//  BookView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var journal = ArtJournalStore.shared

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if journal.entries.isEmpty {
                Text("Your sketchbook is empty")
                    .foregroundColor(.white.opacity(0.6))
            } else {
                PageCurlView(pages: journal.entries as! [UIHostingController<JournalPageView>])
                    .ignoresSafeArea()
            }
        }
    }
}
