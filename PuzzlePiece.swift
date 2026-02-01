//
//  PuzzlePiece.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct PuzzlePiece: Identifiable, Equatable {
    let id = UUID()
    let image: String
    let correctIndex: Int
}
