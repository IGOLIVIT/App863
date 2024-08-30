//
//  EatView.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct EatView: View {

    @StateObject var viewModel = RestViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image(viewModel.PPhoto)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    
                    Text(viewModel.PName)
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                    
                    Menu(content: {
                        
                        Button(action: {
                            
                            viewModel.isEat = false
                            viewModel.isSetting = false
                            viewModel.isRest = true
               
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Restaurant")
                                
                                Text("Restaurants")
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: Color("prim2"), radius: 5))
                        })
                        
                        Button(action: {

                            viewModel.isEat = true
                            viewModel.isSetting = false
                            viewModel.isRest = false
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Favorite dishes")
                                
                                Text("Favorite dishes")
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: Color("prim2"), radius: 5))
                        })
                        
                        Button(action: {
                            
                            viewModel.isEat = false
                            viewModel.isRest = false
                            viewModel.isSetting = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Settings")
                                
                                Text("Settings")
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: Color("prim2"), radius: 5))
                        })
                        
                    }, label: {
                        
                        VStack {
                            
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color("prim2"))
                                .frame(width: 40, height: 4)
                            
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color("prim2"))
                                .frame(width: 40, height: 4)
                            
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color("prim2"))
                                .frame(width: 40, height: 4)
                        }
                    })
                }
                .padding(.bottom, 25)

                if viewModel.foods.isEmpty {
                    
                    VStack {
                        
                        Text("Not")
                            .foregroundColor(.black)
                            .font(.system(size: 80, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("selected dishes go to the restaurant page and add dishes to your favorites")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 250)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack(spacing: 0) {
                                
                                Text("TO RESTAURANTS")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                                
                                Image(systemName: "arrow.up.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                    .padding()
                                    .background(Circle().fill(Color("prim2")))
                            }
                        })
                        .padding(.leading, 30)
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.foods, id: \.self) { index in
                            
                                VStack {
                                    
                                    Image(index.foodPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 110)
                                    
                                    Text(index.foodName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    HStack {
                                        
                                        Image("stars")
                                        
                                        Text(index.foodRate ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Spacer()
                                    }
                                    
                                    Text("\(index.foodCost ?? "") $")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 20)
                                        .background(RoundedRectangle(cornerRadius: 3).fill(.white))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchFoods()
        }
        .sheet(isPresented: $viewModel.isRest, content: {
            
            RestView()
        })
        .sheet(isPresented: $viewModel.isEat, content: {
            
            EatView()
        })
        .sheet(isPresented: $viewModel.isSetting, content: {
            
            SettingsView()
        })
    }
}

#Preview {
    EatView()
}
