//
//  Not.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("prim2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    
                    Text("Don’t miss the most userful information")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable notifications")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
