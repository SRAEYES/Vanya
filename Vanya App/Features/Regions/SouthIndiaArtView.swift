//
//  SouthIndiaArtView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct SouthIndiaArtView: View {
    
    @State private var searchText = ""
    
    struct ArtItem: Identifiable {
        let id = UUID()
        let image: String
        let title: String
        let subtitle: String
    }

    let allArts: [ArtItem] = [
        ArtItem(image: "kalamkari", title: "Kalamkari", subtitle: "Andhra Pradesh"),
        ArtItem(image: "tanjore", title: "Tanjore", subtitle: "Tamil Nadu"),
        ArtItem(image: "cheriyal", title: "Cheriyal", subtitle: "Telangana")
    ]

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var filteredArts: [ArtItem] {
        if searchText.isEmpty {
            return allArts
        } else {
            return allArts.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.subtitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {

                LinearGradient(
                    colors: [
                        Color(red: 8/255, green: 12/255, blue: 30/255),
                        Color.black
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

            VStack(spacing: 0) {
                StickyGalleryHeader()

                    // 🔍 Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white.opacity(0.6))

                        TextField("Search art or state", text: $searchText)
                            .foregroundColor(.white)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.08))
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        PremiumArtTile(
                            image: "kalamkari",
                            title: "Kalamkari",
                            subtitle: "Andhra Pradesh"
                        )
                        
                        PremiumArtTile(
                            image: "tanjore",
                            title: "Tanjore",
                            subtitle: "Tamil Nadu"
                        )
                        
                        PremiumArtTile(
                            image: "cheriyal",
                            title: "Cheriyal",
                            subtitle: "Telangana"
                        )
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .padding(.bottom, 40)
                }
            }
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 8/255, green: 12/255, blue: 30/255),
                        Color.black
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            }
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}
