//
//  ColoredStroke.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct ColoredStroke: Identifiable {
    let id = UUID()
    let color: Color
    var points: [CGPoint]
}
