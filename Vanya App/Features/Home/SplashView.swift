//
//  SplashView.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import SwiftUI

struct SplashView: View {

    @State private var animate = false
    @State private var goNext = false

    var body: some View {
        ZStack {
            Color(red: 8/255, green: 12/255, blue: 30/255)
                .ignoresSafeArea()
            
            VStack(spacing: 18) {
                
                Image("peacock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)   // controls size
                    .shadow(color: .black.opacity(0.4), radius: 8)
                    .opacity(animate ? 1 : 0)
                    .scaleEffect(animate ? 1 : 0.7)
                    .offset(y: animate ? 0 : -10)
                
 
                Text("Vanya")
                    .font(.system(size: 46, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.orange, .white, .mint],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .opacity(animate ? 1 : 0)
//                    .opacity(animate ? 1 : 0)
                    .animation(.easeIn.delay(0.2), value: animate)

            }
        }
        
        .onAppear {
            withAnimation(.easeOut(duration: 1.2)) {
                animate = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                goNext = true
            }
        }
        .fullScreenCover(isPresented: $goNext) {
            HomeView()
        }
    }
}
