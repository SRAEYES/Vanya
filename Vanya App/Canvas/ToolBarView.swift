//
//  ToolBarView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI
import PencilKit

enum DrawingTool {
    case pencil, pen, marker, eraser
}

struct ToolBarView: View {

    @Binding var selectedTool: PKTool
    @State private var activeTool: DrawingTool = .pencil
    @State private var selectedColor: UIColor = .black

    var body: some View {
        HStack(spacing: 14) {

            toolButton("pencil", .pencil)
            toolButton("pencil.tip", .pen)
            toolButton("paintbrush", .marker)
            toolButton("eraser", .eraser)

            Divider().frame(height: 26)

            color(.red)
            color(.blue)
            color(.green)
            color(.orange)
            color(.brown)

        }
        .padding(14)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: 12)
        .padding(.bottom, 24)
    }

    // MARK: - Tool Button
    func toolButton(_ icon: String, _ tool: DrawingTool) -> some View {
        Button {
            activeTool = tool
            updateTool()
        } label: {
            Image(systemName: icon)
                .foregroundColor(activeTool == tool ? .white : .gray)
                .padding(10)
                .background(
                    Circle()
                        .fill(activeTool == tool ? Color.blue : Color.clear)
                )
        }
    }

    // MARK: - Color
    func color(_ color: UIColor) -> some View {
        Circle()
            .fill(Color(color))
            .frame(width: 22, height: 22)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: selectedColor == color ? 2 : 0)
            )
            .onTapGesture {
                selectedColor = color
                updateTool()
            }
    }

    // MARK: - Tool Logic
    func updateTool() {
        switch activeTool {
        case .pencil:
            selectedTool = PKInkingTool(.pencil, color: selectedColor, width: 5)
        case .pen:
            selectedTool = PKInkingTool(.pen, color: selectedColor, width: 6)
        case .marker:
            selectedTool = PKInkingTool(.marker, color: selectedColor, width: 14)
        case .eraser:
            selectedTool = PKEraserTool(.vector)
        }
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
}
