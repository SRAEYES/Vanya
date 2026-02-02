//
//  RegionDetailView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

@available(iOS 18.0, *)
struct RegionDetailView: View {

    var body: some View {
        List {
            NavigationLink("Kalamkari Art") {
                ArtExperienceView()
            }
        }
        .navigationTitle("South Indian Art")
    }
}
