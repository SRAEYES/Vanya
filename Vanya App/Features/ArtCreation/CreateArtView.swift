//
//  CreateArtView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI
import PencilKit

@available(iOS 17.0, *)
struct CreateArtView: View {

    @Environment(\.dismiss) var dismiss
    @State private var canvasView = PKCanvasView()
    @State private var selectedTool: PKTool = PKInkingTool(.pencil, color: .black, width: 5)
    @State private var showGuide = true
    @State private var guideOpacity: Double = 0.35
    @State private var breathingAnimation = false
    @State private var showSaveSuccess = false
    @State private var showColorPicker = false

    var body: some View {
        ZStack {
            // Premium gradient background
            LinearGradient(
                colors: [
                    Color(red: 0.98, green: 0.97, blue: 0.95),
                    Color(red: 0.95, green: 0.94, blue: 0.92)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                // Refined Top Bar
                HStack(spacing: 12) {
                    // Back button
                    Button {
                        dismiss()
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(.black.opacity(0.7))
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
                            )
                    }
                    
                    Spacer()
                    
                    // Guide toggle - moved slightly left
                    HStack(spacing: 10) {
                        Button {
                            withAnimation(.spring(response: 0.3)) {
                                showGuide.toggle()
                            }
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        } label: {
                            Image(systemName: showGuide ? "eye.fill" : "eye.slash.fill")
                                .font(.system(size: 14))
                                .foregroundColor(showGuide ? .orange : .gray)
                                .frame(width: 36, height: 36)
                                .background(
                                    Circle()
                                        .fill(showGuide ? Color.orange.opacity(0.12) : Color.gray.opacity(0.08))
                                )
                        }
                        
                        // Brightness slider - more compact
                        if showGuide {
                            HStack(spacing: 6) {
                                Image(systemName: "sun.max.fill")
                                    .font(.system(size: 11))
                                    .foregroundColor(.orange.opacity(0.6))
                                
                                Slider(value: $guideOpacity, in: 0.1...0.6)
                                    .frame(width: 85)
                                    .tint(.orange)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(.ultraThinMaterial)
                            )
                            .transition(.scale.combined(with: .opacity))
                        }
                    }
                    
                    Spacer()
                    
                    // Save button
                    Button {
                        saveArtwork()
                    } label: {
                        Image(systemName: showSaveSuccess ? "checkmark.circle.fill" : "arrow.down.circle.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: showSaveSuccess ? [.green, .mint] : [.orange, .orange.opacity(0.8)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .shadow(color: (showSaveSuccess ? Color.green : Color.orange).opacity(0.4), radius: 8, x: 0, y: 2)
                            )
                    }
                    .disabled(showSaveSuccess)
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                .padding(.bottom, 8)
                
                // Maximum Drawing Area
                ZStack {
                    if showGuide {
                        Image("kalamkari_outline")
                            .resizable()
                            .scaledToFit()
                            .opacity(guideOpacity)
                            .scaleEffect(breathingAnimation ? 1.005 : 1.0)
                            .padding(20)
                            .overlay(
                                Image("kalamkari_outline")
                                    .resizable()
                                    .scaledToFit()
                                    .blur(radius: breathingAnimation ? 3 : 1)
                                    .opacity(guideOpacity * 0.3)
                                    .padding(20)
                            )
                            .onAppear {
                                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                    breathingAnimation = true
                                }
                            }
                    }

                    DrawingCanvas(
                        canvasView: $canvasView,
                        tool: $selectedTool
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 16)
                }
                .frame(maxHeight: .infinity)
                
                // Ultra-Modern Toolbar
                UltraModernToolbar(
                    selectedTool: $selectedTool,
                    showColorPicker: $showColorPicker
                )
                .padding(.bottom, 12)
            }
            
            // Save success
            if showSaveSuccess {
                VStack {
                    Spacer()
                    
                    HStack(spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.green)
                        
                        Text("Saved to Journal")
                            .font(.subheadline.weight(.medium))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .background(
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .shadow(color: .green.opacity(0.2), radius: 12, x: 0, y: 6)
                    )
                    .padding(.bottom, 100)
                }
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            canvasView.drawingPolicy = .anyInput
            canvasView.backgroundColor = .clear
        }
    }

    func saveArtwork() {
        let drawing = canvasView.drawing
        let bounds = drawing.bounds.isEmpty ? CGRect(x: 0, y: 0, width: 1024, height: 1024) : drawing.bounds
        let image = drawing.image(from: bounds, scale: UIScreen.main.scale)

        ArtJournalStore.shared.save(
            title: "Kalamkari Art",
            image: image,
            completed: false
        )

        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        
        withAnimation(.spring(response: 0.4)) {
            showSaveSuccess = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.spring(response: 0.4)) {
                showSaveSuccess = false
            }
        }
    }
}
