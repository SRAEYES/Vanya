//
//  JournalView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 02/02/26.
//


import SwiftUI

struct JournalView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background: Deep Obsidian Depth
                Color.black.ignoresSafeArea()
                
                // Subtle ambient glow in the corner
                Circle()
                    .fill(Color.blue.opacity(0.15))
                    .blur(radius: 100)
                    .offset(x: -150, y: -300)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 32) {
                        
                        // Header: Minimalist & Clean
                        VStack(alignment: .leading, spacing: 8) {
                            Text("My Art Journal")
                                .font(.system(size: 34, weight: .semibold, design: .serif)) // Serif adds class
                                .foregroundStyle(.white.opacity(0.9))
                            
                            Text("3 Sketchbooks • Updated today")
                                .font(.footnote)
                                .fontWeight(.medium)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.top, 20)

                        VStack(spacing: 18) {
                            // UNLOCKED BOOK (With Image)
                            NavigationLink(destination: JournalBookView()) {
                                FeaturedBookCard(
                                    title: "Spiral Sketchbook",
                                    subtitle: "24 Pages • Practice & Drafts",
                                    imageName: "spiral_preview", // Add your image to Assets
                                    isLocked: false
                                )
                            }
                            .buttonStyle(PlainButtonStyle())

                            // LOCKED BOOKS (Lower Opacity / Desaturated)
                            BookRow(title: "Folk Art Journal", icon: "lock.fill", isLocked: true)
                            BookRow(title: "Museum Archive", icon: "lock.fill", isLocked: true)
                        }
                    }
                    .padding(20)
                }
            }
        }
    }
}

// MARK: - Premium Featured Card
struct FeaturedBookCard: View {
    let title: String
    let subtitle: String
    let imageName: String
    let isLocked: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image Section
            ZStack(alignment: .bottomLeading) {
                // Replace with Image(imageName) when you have your asset
                Rectangle()
                    .fill(LinearGradient(colors: [Color(white: 0.15), Color(white: 0.05)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .aspectRatio(16/9, contentMode: .fill)
                    .overlay(
                        Image(systemName: "scribble.variable") // Placeholder icon
                            .font(.system(size: 40))
                            .foregroundStyle(.white.opacity(0.1))
                    )
                
                // Badge
                Text("CURRENTLY EDITING")
                    .font(.system(size: 10, weight: .bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.blue.opacity(0.8))
                    .clipShape(Capsule())
                    .padding(12)
            }
            
            // Text Section
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.9))
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(white: 0.08))
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.white.opacity(0.1), lineWidth: 0.5)
        )
    }
}

// MARK: - Minimal Row for Locked items
struct BookRow: View {
    let title: String
    let icon: String
    let isLocked: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.body)
                .foregroundStyle(.white.opacity(0.4)) // Dimmed for locked state
            Spacer()
            Image(systemName: icon)
                .font(.footnote)
                .foregroundStyle(.white.opacity(0.2))
        }
        .padding(20)
        .background(Color(white: 0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.white.opacity(0.05), lineWidth: 1)
        )
    }
}
