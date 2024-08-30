//
//  ProfileView.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct ProfileView: View {

    @StateObject var viewModel = ProfileViewModel()
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("pbg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 20) {
                
                Text("Let’s create your profile!")
                    .foregroundColor(Color("prim2"))
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text("Add your name and your age")
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)

                ZStack(alignment: .leading, content: {
                    
                    Text("Name")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.enterName.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.enterName)
                        .foregroundColor(Color.black)
                        .font(.system(size: 14, weight: .semibold))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                .padding(.horizontal)
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Age")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.enterAge.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.enterAge)
                        .foregroundColor(Color.black)
                        .font(.system(size: 14, weight: .semibold))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                .padding(.horizontal)
            }
            
            VStack {
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    ProfileView2()
                        .navigationBarBackButtonHidden()

                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(viewModel.enterAge.isEmpty || viewModel.enterName.isEmpty ? Color("prim") : Color("prim2")))
                })
                .padding()
                .padding(.bottom, 30)
                .onTapGesture {
                    
                    viewModel.age = viewModel.enterAge
                    viewModel.PName = viewModel.enterName
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
