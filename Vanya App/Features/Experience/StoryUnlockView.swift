//
//  StoryUnlockView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI
//
//struct StoryUnlockView: View {
//
//    var body: some View {
//        ZStack {
//
//            LinearGradient(
//                colors: [
//                    Color(red: 8/255, green: 12/255, blue: 30/255),
//                    Color.black
//                ],
//                startPoint: .top,
//                endPoint: .bottom
//            )
//            .ignoresSafeArea()
//
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//
//                    Text("Kalamkari")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//
//                    Text("Andhra Pradesh")
//                        .foregroundColor(.white.opacity(0.6))
//
//                    Text("""
//Kalamkari is a traditional hand-painted textile art from Andhra Pradesh, created using natural dyes on cotton fabric.
//
//The stories depicted often come from the Ramayana and Mahabharata, turning cloth into a narrative medium passed across generations.
//""")
//                    .foregroundColor(.white)
//                    .font(.body)
//
//                }
//                .padding()
//            }
//        }
//    }
//}




//struct StoryUnlockView: View {
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        ZStack {
//            Color.black.ignoresSafeArea()
//            
//            ScrollView {
//                VStack(alignment: .leading, spacing: 24) {
//                    // Hero Image Area
//                    ZStack(alignment: .bottomLeading) {
//                        Image("kalamkari_full") // Your full image
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(height: 400)
//                            .overlay(
//                                LinearGradient(colors: [.clear, .black.opacity(0.8)], startPoint: .center, endPoint: .bottom)
//                            )
//                        
//                        VStack(alignment: .leading, spacing: 8) {
//                            Text("ANDHRA PRADESH")
//                                .font(.caption.bold())
//                                .tracking(2)
//                                .foregroundColor(.orange)
//                            
//                            Text("The Art of Kalamkari")
//                                .font(.system(size: 40, weight: .bold, design: .serif))
//                                .foregroundColor(.white)
//                        }
//                        .padding(30)
//                    }
//                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                    
//                    // Story Content
//                    VStack(alignment: .leading, spacing: 20) {
//                        Text("A Narrative in Every Thread")
//                            .font(.title2.bold())
//                            .foregroundColor(.white)
//
//                        Text("Kalamkari is a traditional hand-painted textile art from Andhra Pradesh, created using natural dyes on cotton fabric.")
//                            .font(.system(.body, design: .serif))
//                            .lineSpacing(8)
//                            .foregroundColor(.white.opacity(0.9))
//
//                        Divider().background(Color.white.opacity(0.2))
//
//                        Text("The stories depicted often come from the Ramayana and Mahabharata, turning cloth into a narrative medium passed across generations. The process involves 23 rigorous steps, including bleaching, softening, and hand-painting with a bamboo pen (kalam).")
//                            .font(.system(.body, design: .serif))
//                            .lineSpacing(8)
//                            .foregroundColor(.white.opacity(0.7))
//                    }
//                    .padding(.horizontal, 30)
//                    .padding(.bottom, 50)
//                }
//            }
//            .ignoresSafeArea()
//            
//            // Floating Back Button
//            VStack {
//                HStack {
//                    Button { dismiss() } label: {
//                        Image(systemName: "xmark")
//                            .font(.system(size: 16, weight: .black))
//                            .foregroundColor(.white)
//                            .padding(12)
//                            .background(.ultraThinMaterial)
//                            .clipShape(Circle())
//                    }
//                    .padding(.leading, 20)
//                    .padding(.top, 50)
//                    Spacer()
//                }
//                Spacer()
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}



//struct StoryUnlockView: View {
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        ZStack(alignment: .top) { // Align the X button to top
//            Color.black.ignoresSafeArea()
//            
//            ScrollView {
//                VStack(alignment: .leading, spacing: 0) {
//                    // MARK: - Compact Hero Header
//                    ZStack(alignment: .bottomLeading) {
//                        Image("kalamkari_full")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(height: 320) // Reduced height from 400
//                            .frame(maxWidth: .infinity)
//                            .overlay(
//                                // Darker gradient at the bottom for text legibility
//                                LinearGradient(
//                                    colors: [.clear, .black.opacity(0.9)],
//                                    startPoint: .top,
//                                    endPoint: .bottom
//                                )
//                            )
//                        
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text("ANDHRA PRADESH")
//                                .font(.system(size: 12, weight: .black))
//                                .tracking(3)
//                                .foregroundColor(.orange)
//                            
//                            Text("The Art of Kalamkari")
//                                .font(.system(size: 34, weight: .bold, design: .serif))
//                                .foregroundColor(.white)
//                                .fixedSize(horizontal: false, vertical: true)
//                        }
//                        .padding(.horizontal, 24)
//                        .padding(.bottom, 20)
//                    }
//                    .clipShape(RoundedRectangle(cornerRadius: 0)) // Flush with top
//                    
//                    // MARK: - Content Body
//                    VStack(alignment: .leading, spacing: 24) {
//                        // Introduction
//                        HStack(alignment: .top, spacing: 15) {
//                            Rectangle()
//                                .fill(Color.orange)
//                                .frame(width: 4, height: 40)
//                            
//                            Text("A Narrative in Every Thread")
//                                .font(.title3.bold())
//                                .foregroundColor(.white)
//                                .frame(maxHeight: .infinity, alignment: .center)
//                        }
//                        .padding(.top, 30)
//
//                        Text("Kalamkari is a traditional hand-painted textile art from Andhra Pradesh, created using natural dyes on cotton fabric.")
//                            .font(.system(.body, design: .serif))
//                            .lineSpacing(6)
//                            .foregroundColor(.white.opacity(0.9))
//
//                        Divider().background(Color.white.opacity(0.2))
//
//                        // Secondary Body Text
//                        Text("The stories depicted often come from the Ramayana and Mahabharata, turning cloth into a narrative medium passed across generations. The process involves 23 rigorous steps, including bleaching, softening, and hand-painting with a bamboo pen (kalam).")
//                            .font(.system(.body, design: .serif))
//                            .lineSpacing(6)
//                            .foregroundColor(.white.opacity(0.7))
//                        
//                        // Added a subtle "Fact" card to use the space well
//                        VStack(alignment: .leading, spacing: 10) {
//                            Label("Artisan Fact", systemImage: "info.circle")
//                                .font(.caption.bold())
//                                .foregroundColor(.orange)
//                            Text("The term originates from Persian: 'Kalam' (pen) and 'Kari' (craftmanship).")
//                                .font(.caption)
//                                .foregroundColor(.white.opacity(0.6))
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(Color.white.opacity(0.05))
//                        .cornerRadius(12)
//                        
//                    }
//                    .padding(.horizontal, 24)
//                }
//            }
//            .ignoresSafeArea()
//            
//            // MARK: - Refined Floating Back Button
//            HStack {
//                Button { dismiss() } label: {
//                    Image(systemName: "xmark")
//                        .font(.system(size: 14, weight: .black))
//                        .foregroundColor(.white)
//                        .padding(10)
//                        .background(.ultraThinMaterial)
//                        .clipShape(Circle())
//                        .shadow(radius: 10)
//                }
//                Spacer()
//            }
//            .padding(.horizontal, 20)
//            .padding(.top, 16) // Much tighter to the top notch
//        }
//        .navigationBarHidden(true)
//    }
//}



struct StoryUnlockView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .top) { // Align the X button to top
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // MARK: - Compact Hero Header
                    ZStack(alignment: .bottomLeading) {
                        Image("kalamkari_full")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 220) // Reduced from 320
                            .frame(maxWidth: .infinity)
                            .overlay(
                                // Darker gradient at the bottom for text legibility
                                LinearGradient(
                                    colors: [.clear, .black.opacity(0.9)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("ANDHRA PRADESH")
                                .font(.system(size: 12, weight: .black))
                                .tracking(3)
                                .foregroundColor(.orange)
                            
                            Text("The Art of Kalamkari")
                                .font(.system(size: 34, weight: .bold, design: .serif))
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 16) // Reduced from 20
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 0)) // Flush with top
                    
                    // MARK: - Content Body
                    VStack(alignment: .leading, spacing: 24) {
                        // Introduction
                        HStack(alignment: .center, spacing: 15) { // Changed to center alignment
                            Rectangle()
                                .fill(Color.orange)
                                .frame(width: 4, height: 40)
                            
                            Text("A Narrative in Every Thread")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                        }
                        .padding(.top, 24) // Reduced from 30

                        Text("Kalamkari is a traditional hand-painted textile art from Andhra Pradesh, created using natural dyes on cotton fabric.")
                            .font(.system(.body, design: .serif))
                            .lineSpacing(6)
                            .foregroundColor(.white.opacity(0.9))

                        Divider().background(Color.white.opacity(0.2))

                        // Secondary Body Text
                        Text("The stories depicted often come from the Ramayana and Mahabharata, turning cloth into a narrative medium passed across generations. The process involves 23 rigorous steps, including bleaching, softening, and hand-painting with a bamboo pen (kalam).")
                            .font(.system(.body, design: .serif))
                            .lineSpacing(6)
                            .foregroundColor(.white.opacity(0.7))
                        
                        // Added a subtle "Fact" card to use the space well
                        VStack(alignment: .leading, spacing: 10) {
                            Label("Artisan Fact", systemImage: "info.circle")
                                .font(.caption.bold())
                                .foregroundColor(.orange)
                            Text("The term originates from Persian: 'Kalam' (pen) and 'Kari' (craftmanship).")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(12)
                        
                    }
                    .padding(.horizontal, 24)
                }
            }
            .ignoresSafeArea()
            
            // MARK: - Refined Floating Back Button
            HStack {
                Button { dismiss() } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .black))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 16) // Much tighter to the top notch
        }
        .navigationBarHidden(true)
    }
}
