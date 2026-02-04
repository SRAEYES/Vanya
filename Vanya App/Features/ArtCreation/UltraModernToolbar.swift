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
//  Award-winning toolbar with sliders
//

import SwiftUI
import PencilKit

@available(iOS 17.0, *)
struct UltraModernToolbar: View {

    @Binding var selectedTool: PKTool
    @Binding var showColorPicker: Bool
    
    @State private var activeTool: DrawingTool = .pencil
    @State private var selectedColor: UIColor = .black
    @State private var brushSize: CGFloat = 5
    @State private var showBrushSlider = false

    let colors: [UIColor] = [
        .black, .darkGray, .white,
        .systemRed, .systemOrange, .systemYellow,
        .systemGreen, .systemMint, .systemTeal,
        .systemBlue, .systemIndigo, .systemPurple,
        .systemPink, .systemBrown
    ]

    var body: some View {
        VStack(spacing: 8) {
            // 🎨 Color Palette Row
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
            
            // 🔧 Brush Size Slider
            if showBrushSlider && activeTool != .eraser {
                VStack(spacing: 6) {
                    HStack(spacing: 12) {
                        Text("SIZE")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.gray)
                        
                        Slider(value: $brushSize, in: 2...20, step: 1)
                            .tint(.orange)
                            .onChange(of: brushSize) { _, _ in
                                updateTool()
                                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                            }
                        
                        Circle()
                            .fill(Color(selectedColor))
                            .frame(width: brushSize, height: brushSize)
                            .shadow(color: Color(selectedColor).opacity(0.4), radius: 4)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.ultraThinMaterial)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
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
                }
                .padding(.horizontal, 16)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
            
            // Main Toolbar
            HStack(spacing: 0) {
                // Color Selector
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        showColorPicker.toggle()
                        if showColorPicker {
                            showBrushSlider = false
                        }
                    }
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color(uiColor: selectedColor))
                            .frame(width: 32, height: 32)
                            .overlay(
                                Circle()
                                    .strokeBorder(.white, lineWidth: 2.5)
                            )
                            .shadow(color: Color(uiColor: selectedColor).opacity(0.5), radius: 8, x: 0, y: 2)
                        
                        if showColorPicker {
                            Circle()
                                .stroke(Color(uiColor: selectedColor), lineWidth: 1)
                                .frame(width: 40, height: 40)
                                .opacity(0.4)
                        }
                    }
                }
                .padding(.leading, 20)
                
                Spacer()
                
                // Tools
                HStack(spacing: 12) {
                    toolButton("pencil", .pencil)
                    toolButton("pencil.tip", .pen)
                    toolButton("paintbrush", .marker)
                    toolButton("paintbrush.fill", .fill)
                    toolButton("eraser", .eraser)
                }
                
                Spacer()
                
                // Brush Size Toggle
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        showBrushSlider.toggle()
                        if showBrushSlider {
                            showColorPicker = false
                        }
                    }
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                } label: {
                    VStack(spacing: 3) {
                        ZStack {
                            Circle()
                                .fill(Color(uiColor: selectedColor))
                                .frame(width: brushPreviewSize, height: brushPreviewSize)
                                .shadow(color: Color(uiColor: selectedColor).opacity(0.4), radius: 4)
                            
                            if showBrushSlider {
                                Circle()
                                    .stroke(Color(uiColor: selectedColor), lineWidth: 1)
                                    .frame(width: brushPreviewSize + 8, height: brushPreviewSize + 8)
                                    .opacity(0.4)
                            }
                        }
                        
                        Text(brushSizeName)
                            .font(.system(size: 8, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 32)
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
        }
    }
    
    // Tool Button
    func toolButton(_ icon: String, _ tool: DrawingTool) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                activeTool = tool
                if tool == .eraser {
                    showBrushSlider = false
                }
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
                .fill(Color(uiColor: color))
                .frame(width: 32, height: 32)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: selectedColor == color ? 3 : 0)
                )
                .shadow(color: Color(uiColor: color).opacity(0.4), radius: selectedColor == color ? 6 : 2)
                .scaleEffect(selectedColor == color ? 1.15 : 1.0)
        }
        .buttonStyle(ScaleButtonStyle())
    }
    
    var brushPreviewSize: CGFloat {
        min(max(brushSize * 1.5, 8), 20)
    }
    
    var brushSizeName: String {
        if brushSize <= 5 { return "FINE" }
        else if brushSize <= 12 { return "MED" }
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
            selectedTool = PKInkingTool(.marker, color: selectedColor, width: 50)
        case .eraser:
            selectedTool = PKEraserTool(.vector)
        }
        
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
    }
}

// Drawing Tool Enum
enum DrawingTool {
    case pencil, pen, marker, fill, eraser
}

// Scale Button Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.90 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
