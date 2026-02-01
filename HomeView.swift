//
//  HomeView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {

                    // 🌌 Background
                    Color(red: 8/255, green: 12/255, blue: 30/255)
                        .ignoresSafeArea()

                    // 🗺️ FULL SCREEN INDIA MAP
                    Image("india_map")
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geo.size.width,
                            height: geo.size.height
                        )
                        .opacity(0.95)

                    // 🏷️ Title
                    VStack(spacing: 6) {
                        Text("Explore Indian Art")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)

                        Text("Touch a region to begin")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .padding(.top, 50)
                    .frame(maxHeight: .infinity, alignment: .top)

                    // 🔓 / 🔒 REGION HOTSPOTS
                    ZStack {

                        // SOUTH (Unlocked)
                        RegionHotspot(
                            title: "S",
                            unlocked: true,
                            offset: CGSize(width: 0, height: geo.size.height * 0.18)
                        )

                        // NORTH
                        RegionHotspot(
                            title: "N",
                            unlocked: false,
                            offset: CGSize(width: 0, height: -geo.size.height * 0.22)
                        )

                        // WEST
                        RegionHotspot(
                            title: "W",
                            unlocked: false,
                            offset: CGSize(width: -geo.size.width * 0.25, height: 0)
                        )

                        // EAST
                        RegionHotspot(
                            title: "E",
                            unlocked: false,
                            offset: CGSize(width: geo.size.width * 0.25, height: 0)
                        )
                    }
                }
            }
        }
    }
}
