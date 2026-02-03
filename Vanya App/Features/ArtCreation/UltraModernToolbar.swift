//
//  UltraModernToolbar.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 03/02/26.
//

//
//  UltraModernToolbar.swift
//  SwiftStudentChalleneg
//
//  Ultra-compact modern toolbar
//

import SwiftUI
import PencilKit

struct UltraModernToolbar: View {

    @Binding var selectedTool: PKTool
    @Binding var showColorPicker: Bool
    
    @State private var activeTool: DrawingTool = .pencil
    @State private var selectedColor: UIColor = .black
    @State private var brushSize: CGFloat = 5
    @State private var showBrushPicker = false
    @State private var showFillMode = false

    let colors: [UIColor] = [
        .black, .systemGray, .white,
        .systemRed, .systemOrange, .systemYellow,
        .systemGreen, .systemMint, .systemTeal,
        .systemBlue, .systemIndigo, .systemPurple,
        .systemPink, .systemBrown
    ]

    var body: some View {
        VStack(spacing: 8) {
            // Color Palette Row
            if showColorPicker {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(colors, id: \.self) { color in
                            colorButton(color)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 44)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
            
            // Main Compact Toolbar
            HStack(spacing: 0) {
                // Color Selector with Glow
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        showColorPicker.toggle()
                    }
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color(selectedColor))
                            .frame(width: 32, height: 32)
                            .overlay(
                                Circle()
                                    .strokeBorder(.white, lineWidth: 2.5)
                            )
                            .shadow(color: Color(selectedColor).opacity(0.5), radius: 8, x: 0, y: 2)
                        
                        if showColorPicker {
                            Circle()
                                .stroke(Color(selectedColor), lineWidth: 1)
                                .frame(width: 40, height: 40)
                                .opacity(0.3)
                        }
                    }
                }
                .padding(.leading, 20)
                
                Spacer()
                
                // Tools with Glow Effect
                HStack(spacing: 12) {
                    toolButton("pencil", .pencil)
                    toolButton("pencil.tip", .pen)
                    toolButton("paintbrush", .marker)
                    toolButton("paintbrush.fill", .fill)
                    toolButton("eraser", .eraser)
                }
                
                Spacer()
                
                // Brush Size with Glow
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        showBrushPicker.toggle()
                    }
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                } label: {
                    VStack(spacing: 4) {
                        Circle()
                            .fill(Color(selectedColor))
                            .frame(width: brushPreviewSize, height: brushPreviewSize)
                            .shadow(color: Color(selectedColor).opacity(0.4), radius: 4)
                        
                        Text(brushSizeName)
                            .font(.system(size: 8, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 32, height: 32)
                }
                .padding(.trailing, 20)
            }
            .frame(height: 56)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(.ultraThinMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .strokeBorder(
                                LinearGradient(
                                    colors: [.white.opacity(0.6), .white.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
                    .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 4)
            )
            .padding(.horizontal, 16)
            
            // Brush Size Picker
            if showBrushPicker {
                VStack(spacing: 8) {
                    Text("Brush Size")
                        .font(.caption.weight(.medium))
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 16) {
                        ForEach([3.0, 5.0, 8.0, 12.0, 16.0], id: \.self) { size in
                            Button {
                                brushSize = size
                                updateTool()
                                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                            } label: {
                                Circle()
                                    .fill(Color(selectedColor))
                                    .frame(width: size * 1.5, height: size * 1.5)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.orange, lineWidth: brushSize == size ? 2 : 0)
                                            .padding(-4)
                                    )
                                    .shadow(color: Color(selectedColor).opacity(0.3), radius: 4)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.ultraThinMaterial)
                    )
                }
                .padding(.horizontal, 16)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
    }
    
    // Tool Button with Glow
    func toolButton(_ icon: String, _ tool: DrawingTool) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                activeTool = tool
                updateTool()
            }
        } label: {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(activeTool == tool ? .orange : .gray)
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(activeTool == tool ? Color.orange.opacity(0.15) : Color.clear)
                        .shadow(color: activeTool == tool ? Color.orange.opacity(0.3) : .clear, radius: 8)
                )
        }
        .buttonStyle(ScaleButtonStyle())
    }

    // Color Button
    func colorButton(_ color: UIColor) -> some View {
        Button {
            withAnimation(.spring(response: 0.2)) {
                selectedColor = color
                updateTool()
            }
        } label: {
            Circle()
                .fill(Color(color))
                .frame(width: 32, height: 32)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: selectedColor == color ? 3 : 0)
                )
                .shadow(color: Color(color).opacity(0.4), radius: selectedColor == color ? 6 : 2)
                .scaleEffect(selectedColor == color ? 1.15 : 1.0)
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    var brushPreviewSize: CGFloat {
        switch activeTool {
        case .pencil: return brushSize * 1.2
        case .pen: return brushSize * 1.3
        case .marker: return brushSize * 1.5
        case .fill: return 12
        case .eraser: return 10
        }
    }
    
    var brushSizeName: String {
        if brushSize <= 3 { return "FINE" }
        else if brushSize <= 8 { return "MED" }
        else { return "BOLD" }
    }

    func updateTool() {
        switch activeTool {
        case .pencil:
            selectedTool = PKInkingTool(.pencil, color: selectedColor, width: brushSize)
        case .pen:
            selectedTool = PKInkingTool(.pen, color: selectedColor, width: brushSize)
        case .marker:
            selectedTool = PKInkingTool(.marker, color: selectedColor, width: brushSize * 1.5)
        case .fill:
            // Fill mode - use marker with large width for now
            selectedTool = PKInkingTool(.marker, color: selectedColor, width: 50)
        case .eraser:
            selectedTool = PKEraserTool(.vector)
        }
        
        // Gentle haptic
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
}

// MARK: - Drawing Tool Enum
enum DrawingTool {
    case pencil, pen, marker, fill, eraser
}
