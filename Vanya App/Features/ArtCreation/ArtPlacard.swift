//
//  ArtPlacard.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//
//
//import SwiftUI
//
//struct ArtCard: View {
//
//    let image: String
//    let title: String
//    let subtitle: String
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//
//            Image(image)
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(14)
//
//            VStack(alignment: .leading, spacing: 4) {
//                Text(title)
//                    .font(.headline)
//                    .foregroundColor(.primary)
//
//                Text(subtitle)
//                    .font(.caption)
//                    .foregroundColor(.secondary)
//
//                Text("Tap to experience →")
//                    .font(.caption2)
//                    .foregroundColor(.blue.opacity(0.7))
//                    .padding(.top, 4)
//            }
//            .padding(.horizontal, 4)
//        }
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 18)
//                .fill(Color.white)
//                .shadow(color: .black.opacity(0.12), radius: 8)
//        )
//        .padding(.horizontal)
//    }
//}
