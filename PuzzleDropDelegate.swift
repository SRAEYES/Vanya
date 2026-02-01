//
//  PuzzleDropDelegate.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct PuzzleDropDelegate: DropDelegate {

    let item: PuzzlePiece
    @Binding var pieces: [PuzzlePiece]
    @Binding var draggedPiece: PuzzlePiece?
    @Binding var unlocked: Bool

    func performDrop(info: DropInfo) -> Bool {

        guard let dragged = draggedPiece,
              let fromIndex = pieces.firstIndex(of: dragged),
              let toIndex = pieces.firstIndex(of: item)
        else {
            return false
        }

        withAnimation(.easeInOut) {
            pieces.swapAt(fromIndex, toIndex)
        }

        checkCompletion()
        UIImpactFeedbackGenerator(style: .light).impactOccurred()

        draggedPiece = nil
        return true
    }

    func checkCompletion() {
        unlocked = pieces.enumerated().allSatisfy {
            $0.element.correctIndex == $0.offset
        }

        if unlocked {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }
}
