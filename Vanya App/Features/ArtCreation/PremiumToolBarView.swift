//
//  PremiumToolBarView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 03/02/26.
//

//
//  PremiumToolBarView.swift
//  SwiftStudentChalleneg
//
//  Premium artistic toolbar
//

import SwiftUI
import PencilKit

struct PremiumToolBarView: View {

    @Binding var selectedTool: PKTool
    @State private var activeTool: DrawingTool = .pencil
    @State private var selectedColor: UIColor = .black
    @State private var showColorPicker = false

    let tools: [(String, DrawingTool)] = [
        ("pencil", .pencil),
        ("pencil.tip", .pen),
        ("paintbrush", .marker),
        ("eraser", .eraser)
    ]
    
    let colors: [UIColor] = [.black, .systemRed, .systemBlue, .systemGreen, .systemOrange, .systemPurple]

    var body: some View {
        VStack(spacing: 16) {
            // Color palette section
            HStack(spacing: 12) {
                // Color palette indicator
                Circle()
                    .fill(Color(selectedColor))
                    .frame(width: 36, height: 36)
                    .overlay(
                        Circle()
                            .strokeBorder(.white, lineWidth: 3)
                    )
                    .overlay(
                        Circle()
                            .strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.3), .clear],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
                    .shadow(color: Color(selectedColor).opacity(0.4), radius: 8, x: 0, y: 4)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3)) {
                            showColorPicker.toggle()
                        }
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    }
                
                Rectangle()
                    .fill(Color.black.opacity(0.1))
                    .frame(width: 1, height: 30)
                
                // Expandable color palette
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(colors, id: \.self) { color in
                            colorButton(color)
                        }
                    }
                }
                
                Rectangle()
                    .fill(Color.black.opacity(0.1))
                    .frame(width: 1, height: 30)
                
                // Brush size indicator
                VStack(spacing: 2) {
                    Image(systemName: "circle.fill")
                        .font(.system(size: brushPreviewSize))
                        .foregroundColor(Color(selectedColor))
                    
                    Text(brushSizeName)
                        .font(.system(size: 8, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.5), .white.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(color: .black.opacity(0.08), radius: 16, x: 0, y: 8)
            
            // Tools section
            HStack(spacing: 14) {
                ForEach(tools, id: \.1) { icon, tool in
                    toolButton(icon: icon, tool: tool)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.5), .white.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .shadow(color: .black.opacity(0.08), radius: 16, x: 0, y: 8)
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Tool Button
    func toolButton(icon: String, tool: DrawingTool) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                activeTool = tool
                updateTool()
            }
        } label: {
            ZStack {
                if activeTool == tool {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(
                            LinearGradient(
                                colors: [.orange, .orange.opacity(0.8)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .orange.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(activeTool == tool ? .white : .gray)
                    .frame(width: 50, height: 50)
            }
        }
        .buttonStyle(ScaleButtonStyle())
    }

    // MARK: - Color Button
    func colorButton(_ color: UIColor) -> some View {
        Button {
            withAnimation(.spring(response: 0.2)) {
                selectedColor = color
                updateTool()
            }
        } label: {
            Circle()
                .fill(Color(color))
                .frame(width: 28, height: 28)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: selectedColor == color ? 3 : 0)
                )
                .shadow(color: Color(color).opacity(0.3), radius: selectedColor == color ? 4 : 0)
                .scaleEffect(selectedColor == color ? 1.1 : 1.0)
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    var brushPreviewSize: CGFloat {
        switch activeTool {
        case .pencil: return 6
        case .pen: return 8
        case .marker: return 12
        case .eraser: return 10
        case .fill:
            return -1
        }
    }
    
    var brushSizeName: String {
        switch activeTool {
        case .pencil: return "FINE"
        case .pen: return "MED"
        case .marker: return "BOLD"
        case .eraser: return "ERASE"
        case .fill:
            return "Nil"
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
        case .fill:
            "Nil"
        }
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
}

// MARK: - Scale Button Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.92 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
