//
//  U1.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("prim2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {

                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("Start now and earn more")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    
                    Text("A proven way to make easy money")
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
    }
}

#Preview {
    U1()
}
