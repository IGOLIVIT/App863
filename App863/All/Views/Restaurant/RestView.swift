//
//  RestView.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct RestView: View {
    
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

                            viewModel.isSetting = false
                            viewModel.isRest = false
                            viewModel.isEat = true
                            
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
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add restaurants +")
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .regular))
                        .padding(10)
                        .padding(.horizontal, 7)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                
                if viewModel.restaurants.isEmpty {
                    
                    VStack {
                        
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 80, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("your first restaurants")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack(spacing: 0) {
                                
                                Text("ADD RESTAURANTS")
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
                        
                        LazyVStack {
                            
                            ForEach(viewModel.restaurants, id: \.self) { index in
                            
                                VStack {
                                    
                                    Image(index.resPhoto ?? "")
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 180)
                                        .overlay(
                                        
                                            VStack {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedRestaurant = index
                                                    
                                                    withAnimation(.spring()) {
                                                        
                                                        viewModel.isDetail = true
                                                    }
                                                    
                                                }, label: {
                                                    
                                                    HStack(spacing: 0) {
                                                        
                                                        Text("More details")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .regular))
                                                            .padding(10)
                                                            .padding(.horizontal, 5)
                                                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                                                        
                                                        Image(systemName: "arrow.up.right")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 11, weight: .regular))
                                                            .padding(8)
                                                            .background(Circle().fill(Color("prim")))
                                                    }
                                                })
                                                .frame(maxWidth: .infinity, alignment: .trailing)
                                                .padding()
                                                
                                                Spacer()
                                            }
                                        )
                                    
                                    HStack {
                                        
                                        Text(index.resName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Image("stars")
                                        
                                        Text(index.resRate ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .semibold))
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                }
                
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchRestaurants()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddRest(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RestDetail(viewModel: viewModel)
        })
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
    RestView()
}
