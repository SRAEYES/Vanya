//
//  SouthIndiaArtView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

//import SwiftUI
//
//@available(iOS 18.0, *)
//struct SouthIndiaArtView: View {
//    
//    @State private var searchText = ""
//    
//    struct ArtItem: Identifiable {
//        let id = UUID()
//        let image: String
//        let title: String
//        let subtitle: String
//    }
//
//    let allArts: [ArtItem] = [
//        ArtItem(image: "kalamkari", title: "Kalamkari", subtitle: "Andhra Pradesh"),
//        ArtItem(image: "tanjore", title: "Tanjore", subtitle: "Tamil Nadu"),
//        ArtItem(image: "cheriyal", title: "Cheriyal", subtitle: "Telangana")
//    ]
//
//    let columns = [
//        GridItem(.flexible(), spacing: 16),
//        GridItem(.flexible(), spacing: 16)
//    ]
//    
//    var filteredArts: [ArtItem] {
//        if searchText.isEmpty {
//            return allArts
//        } else {
//            return allArts.filter {
//                $0.title.localizedCaseInsensitiveContains(searchText) ||
//                $0.subtitle.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//
//                LinearGradient(
//                    colors: [
//                        Color(red: 8/255, green: 12/255, blue: 30/255),
//                        Color.black
//                    ],
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                .ignoresSafeArea()
//
//            VStack(spacing: 0) {
//                StickyGalleryHeader()
//
//                    // 🔍 Search Bar
//                    HStack {
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.white.opacity(0.6))
//
//                        TextField("Search art or state", text: $searchText)
//                            .foregroundColor(.white)
//                            .textInputAutocapitalization(.never)
//                            .disableAutocorrection(true)
//                    }
//                    .padding(12)
//                    .background(
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(Color.white.opacity(0.08))
//                    )
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 8)
//                
//                ScrollView {
//                    LazyVGrid(columns: columns, spacing: 20) {
//                        
//                        PremiumArtTile(
//                            image: "kalamkari",
//                            title: "Kalamkari",
//                            subtitle: "Andhra Pradesh"
//                        )
//                        
//                        PremiumArtTile(
//                            image: "tanjore",
//                            title: "Tanjore",
//                            subtitle: "Tamil Nadu"
//                        )
//                        
//                        PremiumArtTile(
//                            image: "cheriyal",
//                            title: "Cheriyal",
//                            subtitle: "Telangana"
//                        )
//                    }
//                    .padding(.horizontal)
//                    .padding(.top, 16)
//                    .padding(.bottom, 40)
//                }
//            }
//            .background(
//                LinearGradient(
//                    colors: [
//                        Color(red: 8/255, green: 12/255, blue: 30/255),
//                        Color.black
//                    ],
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                .ignoresSafeArea()
//            )
//            }
//            .toolbarBackground(.hidden, for: .navigationBar)
//        }
//    }
//}
//


import SwiftUI

@available(iOS 18.0, *)
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
        searchText.isEmpty ? allArts : allArts.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.subtitle.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 🌌 Deep Canvas Background
                Color.black.ignoresSafeArea()
                
                // Ambient Glow to make the glass tiles pop
                RadialGradient(colors: [Color.blue.opacity(0.2), .clear], center: .topLeading, startRadius: 0, endRadius: 600)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    StickyGalleryHeader()
                        .padding(.bottom, 10)

                    // 🔍 Minimalist Glass Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.white.opacity(0.4))
                        
                        TextField("", text: $searchText, prompt:
                            Text("Search traditions...")
                                .foregroundColor(.white.opacity(0.25))
                        )
                        .foregroundColor(.white)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(.white.opacity(0.06))
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(.white.opacity(0.1), lineWidth: 0.5))
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredArts) { art in
                                PremiumArtTile(
                                    image: art.image,
                                    title: art.title,
                                    subtitle: art.subtitle
                                )
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 8)
                        .padding(.bottom, 40)
                    }
                }
            }
        }
    }
}
