//
//  SouthIndiaArtView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct SouthIndiaArtView: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
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
