//
//  PuzzleView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct PuzzleView: View {

    @State private var pieces: [PuzzlePiece] = [
        PuzzlePiece(image: "kalamkari_p1", correctIndex: 0),
        PuzzlePiece(image: "kalamkari_p2", correctIndex: 1),
        PuzzlePiece(image: "kalamkari_p3", correctIndex: 2),
        PuzzlePiece(image: "kalamkari_p4", correctIndex: 3)
    ].shuffled()

    @State private var selectedPiece: PuzzlePiece?
    @State private var unlocked = false
    @State private var showHint = false

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 20) {

                // 🧩 Header
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Cultural Puzzle")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Tap pieces to rearrange")
                            .foregroundColor(.white.opacity(0.6))
                    }

                    Spacer()

                    // 💡 Hint Button
                    Button {
                        withAnimation {
                            showHint.toggle()
                        }
                    } label: {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.yellow)
                            .font(.title3)
                    }
                }
                .padding(.horizontal)

                // 🧩 Puzzle Grid
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(pieces.indices, id: \.self) { index in
                        let piece = pieces[index]
                        let isCorrect = piece.correctIndex == index
                        let isSelected = selectedPiece?.id == piece.id

                        Image(piece.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 140)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                            // 🌟 Snap glow when correct
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(
                                        isCorrect ? Color.green :
                                        isSelected ? Color.blue :
                                        Color.white.opacity(0.1),
                                        lineWidth: isCorrect ? 4 : 2
                                    )
                            )
                            .shadow(
                                color: isCorrect ? Color.green.opacity(0.6) : .clear,
                                radius: isCorrect ? 10 : 0
                            )

                            // 💡 Hint overlay
                            .opacity(showHint && !isCorrect ? 0.4 : 1)

                            // 👆 Tap interaction
                            .onTapGesture {
                                handleTap(on: piece, at: index)
                            }
                    }
                }
                .padding()

                // 🔓 Unlock Story
                if unlocked {
                    NavigationLink {
                        StoryUnlockView()
                    } label: {
                        Text("Unlock Story →")
                            .font(.headline)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Capsule().fill(Color.green))
                            .foregroundColor(.white)
                    }
                }

                Spacer()
            }
            .padding(.top, 40)
        }
    }

    // 🔁 Tap-to-swap logic
    func handleTap(on piece: PuzzlePiece, at index: Int) {

        if let selected = selectedPiece,
           let fromIndex = pieces.firstIndex(of: selected) {

            withAnimation(.easeInOut) {
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
        unlocked = pieces.enumerated().allSatisfy {
            $0.element.correctIndex == $0.offset
        }

        if unlocked {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }
}
