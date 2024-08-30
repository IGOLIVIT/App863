//
//  R1.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("lbg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 16) {
                
                Text("Hello!")
                    .foregroundColor(Color("prim2"))
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("This is your restaurant critic's notebook.")
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Text("First, let's get to know each other")
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                NavigationLink(destination: {
                    
                    ProfileView()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Start")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    R1()
}
