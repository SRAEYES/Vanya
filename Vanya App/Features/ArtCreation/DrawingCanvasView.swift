//
//  DrawingCanvasView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI
import PencilKit

struct DrawingCanvas: UIViewRepresentable {

    @Binding var canvasView: PKCanvasView
    @Binding var tool: PKTool

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.tool = tool
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        uiView.tool = tool
    }
}
