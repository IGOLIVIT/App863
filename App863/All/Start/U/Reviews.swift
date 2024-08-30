//
//  Reviews.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    
                    Text("Help make the app even better")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                    })
                    .padding(.bottom, 25)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 320)
                .background(Color.black)
            }
            .ignoresSafeArea()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
