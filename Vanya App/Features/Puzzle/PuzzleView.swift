//
//  PuzzleView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

//import SwiftUI
//
//struct PuzzleView: View {
//
//    @State private var pieces: [PuzzlePiece] = [
//        PuzzlePiece(image: "kalamkari_p1", correctIndex: 0),
//        PuzzlePiece(image: "kalamkari_p2", correctIndex: 1),
//        PuzzlePiece(image: "kalamkari_p3", correctIndex: 2),
//        PuzzlePiece(image: "kalamkari_p4", correctIndex: 3)
//    ].shuffled()
//
//    @State private var selectedPiece: PuzzlePiece?
//    @State private var unlocked = false
//    @State private var showHint = false
//
//    let columns = [
//        GridItem(.flexible(), spacing: 12),
//        GridItem(.flexible(), spacing: 12)
//    ]
//
//    var body: some View {
//        ZStack {
//            Color.black.ignoresSafeArea()
//
//            VStack(spacing: 20) {
//
//                // 🧩 Header
//                HStack {
//                    VStack(alignment: .leading, spacing: 6) {
//                        Text("Cultural Puzzle")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//
//                        Text("Tap pieces to rearrange")
//                            .foregroundColor(.white.opacity(0.6))
//                    }
//
//                    Spacer()
//
//                    // 💡 Hint Button
//                    Button {
//                        withAnimation {
//                            showHint.toggle()
//                        }
//                    } label: {
//                        Image(systemName: "lightbulb")
//                            .foregroundColor(.yellow)
//                            .font(.title3)
//                    }
//                }
//                .padding(.horizontal)
//
//                // 🧩 Puzzle Grid
//                LazyVGrid(columns: columns, spacing: 12) {
//                    ForEach(pieces.indices, id: \.self) { index in
//                        let piece = pieces[index]
//                        let isCorrect = piece.correctIndex == index
//                        let isSelected = selectedPiece?.id == piece.id
//
//                        Image(piece.image)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(height: 140)
//                            .clipShape(RoundedRectangle(cornerRadius: 12))
//
//                            // 🌟 Snap glow when correct
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(
//                                        isCorrect ? Color.green :
//                                        isSelected ? Color.blue :
//                                        Color.white.opacity(0.1),
//                                        lineWidth: isCorrect ? 4 : 2
//                                    )
//                            )
//                            .shadow(
//                                color: isCorrect ? Color.green.opacity(0.6) : .clear,
//                                radius: isCorrect ? 10 : 0
//                            )
//
//                            // 💡 Hint overlay
//                            .opacity(showHint && !isCorrect ? 0.4 : 1)
//
//                            // 👆 Tap interaction
//                            .onTapGesture {
//                                handleTap(on: piece, at: index)
//                            }
//                    }
//                }
//                .padding()
//
//                // 🔓 Unlock Story
//                if unlocked {
//                    NavigationLink {
//                        StoryUnlockView()
//                    } label: {
//                        Text("Unlock Story →")
//                            .font(.headline)
//                            .padding(.horizontal, 24)
//                            .padding(.vertical, 12)
//                            .background(Capsule().fill(Color.green))
//                            .foregroundColor(.white)
//                    }
//                }
//
//                Spacer()
//            }
//            .padding(.top, 40)
//        }
//    }
//
//    // 🔁 Tap-to-swap logic
//    func handleTap(on piece: PuzzlePiece, at index: Int) {
//
//        if let selected = selectedPiece,
//           let fromIndex = pieces.firstIndex(of: selected) {
//
//            withAnimation(.easeInOut) {
//                pieces.swapAt(fromIndex, index)
//            }
//
//            selectedPiece = nil
//            checkCompletion()
//            UIImpactFeedbackGenerator(style: .light).impactOccurred()
//
//        } else {
//            selectedPiece = piece
//            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
//        }
//    }
//
//    // ✅ Completion check
//    func checkCompletion() {
//        unlocked = pieces.enumerated().allSatisfy {
//            $0.element.correctIndex == $0.offset
//        }
//
//        if unlocked {
//            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//        }
//    }
//}


import SwiftUI

struct PuzzleView: View {

    @Environment(\.dismiss) var dismiss
    @State private var pieces: [PuzzlePiece] = [
        PuzzlePiece(image: "kalamkari_p1", correctIndex: 0),
        PuzzlePiece(image: "kalamkari_p2", correctIndex: 1),
        PuzzlePiece(image: "kalamkari_p3", correctIndex: 2),
        PuzzlePiece(image: "kalamkari_p4", correctIndex: 3)
    ].shuffled()

    @State private var selectedPiece: PuzzlePiece?
    @State private var unlocked = false
    @State private var showHint = false
    @State private var showCelebration = false

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ZStack {
            // 🌌 Modern gradient background
            LinearGradient(
                colors: [
                    Color(red: 8/255, green: 12/255, blue: 30/255),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {

                // 🎯 Modern Header
                VStack(spacing: 12) {
                    HStack {
                        // Back button
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.body.weight(.semibold))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                )
                        }
                        
                        Spacer()
                        
                        // Hint Button - Modern style
                        Button {
                            withAnimation(.spring(response: 0.3)) {
                                showHint.toggle()
                            }
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: showHint ? "lightbulb.fill" : "lightbulb")
                                    .font(.body)
                                Text(showHint ? "Hide" : "Hint")
                                    .font(.subheadline.weight(.medium))
                            }
                            .foregroundColor(showHint ? .black : .yellow)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(showHint ? Color.yellow : Color.yellow.opacity(0.15))
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    
                    // Title Section
                    VStack(spacing: 6) {
                        Text("Cultural Puzzle")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("Tap pieces to swap and complete the artwork")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.6))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 8)
                    
                    // Progress indicator
                    HStack(spacing: 8) {
                        ForEach(0..<4) { index in
                            let isCorrect = pieces.indices.contains(index) && pieces[index].correctIndex == index
                            Circle()
                                .fill(isCorrect ? Color.green : Color.white.opacity(0.2))
                                .frame(width: 8, height: 8)
                                .scaleEffect(isCorrect ? 1.2 : 1.0)
                                .animation(.spring(response: 0.3), value: isCorrect)
                        }
                    }
                    .padding(.top, 12)
                }
                .padding(.bottom, 24)

                // 🧩 Award-Winning Puzzle Grid
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pieces.indices, id: \.self) { index in
                        let piece = pieces[index]
                        let isCorrect = piece.correctIndex == index
                        let isSelected = selectedPiece?.id == piece.id

                        ZStack {
                            // Puzzle piece image
                            Image(piece.image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 160)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .opacity(showHint && !isCorrect ? 0.3 : 1)
                            
                            // Premium glow effect for correct pieces - INCREASED GLOW
                            if isCorrect {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(
                                        LinearGradient(
                                            colors: [.green.opacity(0.9), .mint.opacity(0.9), .green.opacity(0.9)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 4
                                    )
                                    .shadow(color: .green.opacity(0.9), radius: 20, x: 0, y: 0)
                                    .shadow(color: .mint.opacity(0.7), radius: 30, x: 0, y: 0)
                                    .shadow(color: .green.opacity(0.5), radius: 40, x: 0, y: 0)
                            }
                            // Selected piece border
                            else if isSelected {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(
                                        LinearGradient(
                                            colors: [.blue, .cyan],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 3
                                    )
                            }
                            // Default subtle border
                            else {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(
                                        Color.white.opacity(0.12),
                                        lineWidth: 2
                                    )
                            }
                            
                            // Selection indicator dot
                            if isSelected && !isCorrect {
                                VStack {
                                    HStack {
                                        Spacer()
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    colors: [.blue, .cyan],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 12, height: 12)
                                            .padding(12)
                                    }
                                    Spacer()
                                }
                            }
                            
                            // Hint number overlay
                            if showHint && !isCorrect {
                                ZStack {
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 50, height: 50)
                                    
                                    Text("\(piece.correctIndex + 1)")
                                        .font(.title.bold())
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        .scaleEffect(isSelected ? 0.95 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
                        .animation(.spring(response: 0.4, dampingFraction: 0.65), value: isCorrect)
                        .onTapGesture {
                            handleTap(on: piece, at: index)
                        }
                    }
                }
                .padding(.horizontal, 20)

                Spacer()
                
                // 🏆 Premium Completion Button - Moved Up
                if unlocked {
                    NavigationLink {
                        StoryUnlockView()
                    } label: {
                        HStack(spacing: 10) {
                            Text("Discover the Story")
                                .font(.system(size: 17, weight: .semibold))
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 15, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 18)
                        .background(
                            ZStack {
                                // Gradient background
                                LinearGradient(
                                    colors: [
                                        Color(red: 0, green: 0.8, blue: 0.4),
                                        Color(red: 0, green: 0.65, blue: 0.35)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                
                                // Subtle shimmer effect
                                LinearGradient(
                                    colors: [
                                        .white.opacity(0),
                                        .white.opacity(0.1),
                                        .white.opacity(0)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            }
                        )
                        .clipShape(Capsule())
                        .shadow(color: Color.green.opacity(0.3), radius: 16, x: 0, y: 8)
                        .shadow(color: Color.green.opacity(0.2), radius: 8, x: 0, y: 4)
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
        }
        .navigationBarHidden(true)
    }

    // 🔁 Tap-to-swap logic
    func handleTap(on piece: PuzzlePiece, at index: Int) {

        if let selected = selectedPiece,
           let fromIndex = pieces.firstIndex(of: selected) {

            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                pieces.swapAt(fromIndex, index)
            }

            selectedPiece = nil
            checkCompletion()
            UIImpactFeedbackGenerator(style: .light).impactOccurred()

        } else {
            selectedPiece = piece
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }
    }

    // ✅ Completion check
    func checkCompletion() {
        let wasUnlocked = unlocked
        
        unlocked = pieces.enumerated().allSatisfy {
            $0.element.correctIndex == $0.offset
        }

        if unlocked && !wasUnlocked {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                showCelebration = true
            }
            
            // Premium haptic celebration sequence
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}
