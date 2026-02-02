//
//  CreateArtView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI
import PencilKit

struct CreateArtView: View {

    @State private var canvasView = PKCanvasView()
    @State private var selectedTool: PKTool =
        PKInkingTool(.pencil, color: .black, width: 5)

    var body: some View {
        ZStack {

            // 🎨 Background artwork (trace guide)
            Image("kalamkari_outline")
                .resizable()
                .scaledToFit()
                .opacity(0.35)
                .ignoresSafeArea()

            // ✏️ Apple Pencil Canvas
            DrawingCanvas(
                canvasView: $canvasView,
                tool: $selectedTool
            )
            .ignoresSafeArea()

            // 🔧 Bottom Toolbar
            VStack {
                Spacer()
                ToolBarView(selectedTool: $selectedTool)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveArtwork()
                }
            }
        }
        .onAppear {
            canvasView.drawingPolicy = .anyInput
        }
    }

    // 💾 Save to Photos
    func saveArtwork() {
        let drawing = canvasView.drawing

        // ✅ Use drawing bounds, not canvas bounds
        let bounds = drawing.bounds.isEmpty
            ? CGRect(x: 0, y: 0, width: 1024, height: 1024)
            : drawing.bounds

        let image = drawing.image(
            from: bounds,
            scale: UIScreen.main.scale
        )

        ArtJournalStore.shared.save(
            title: "Kalamkari Art",
            image: image,
            completed: false
        )

        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

}
