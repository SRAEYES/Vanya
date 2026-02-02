//
//  JournalBookView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//

import SwiftUI

struct JournalBookView: View {

    @ObservedObject var journal = ArtJournalStore.shared

    var body: some View {

        let pages: [UIViewController] =
            [UIHostingController(rootView: JournalCoverView())]
            +
            journal.entries.map {
                UIHostingController(
                    rootView: JournalPageView(entry: $0)
                )
            }
            +
            [UIHostingController(rootView: JournalEndView())]

        ZStack {
            Color.black.ignoresSafeArea()

            // 📖 Page curl book
            PageCurlView(pages: pages)
                .ignoresSafeArea()

            // 🌀 Spiral binding (fixed)
            HStack {
                SpiralBindingView()
                Spacer()
            }
            .ignoresSafeArea()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
