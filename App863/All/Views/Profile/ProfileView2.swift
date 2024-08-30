//
//  ProfileView2.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct ProfileView2: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 20) {
                
                Text("Let’s create your profile!")
                    .foregroundColor(Color("prim2"))
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("Choose your character photo")
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                    
                    ForEach(viewModel.profPhoto, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentPPhoto = index
                            
                        }, label: {
                            
                            Image(index)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(color: Color("prim").opacity(viewModel.currentPPhoto == index ? 1 : 0), radius: 20)
                        })
                        .padding(30)
                    }
                })
                
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.PPhoto = viewModel.currentPPhoto
                    status = true
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 30).fill(viewModel.currentPPhoto.isEmpty ? Color("prim") : Color("prim2")))                })
                .padding()
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ProfileView2()
}
