//
//  HomeView.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var router
    @Environment(\.presentationMode) var back
    @Environment(\.presentationMode) var nazad
    
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
                            
                            router.wrappedValue.dismiss()
                            router.wrappedValue.dismiss()
                            viewModel.isRest = true
               
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Restaurant")
                                
                                Text("Restaurants")
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: Color("prim2"), radius: 5))
                        })
                        
                        Button(action: {

                            router.wrappedValue.dismiss()
                            router.wrappedValue.dismiss()
                            viewModel.isEat = false
                            
                        }, label: {
                            
                            HStack {
                                
                                Image("Favorite dishes")
                                
                                Text("Favorite dishes")
                            }
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: Color("prim2"), radius: 5))
                        })
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            router.wrappedValue.dismiss()
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

                Image("hbg")
                    .resizable()
                    .overlay(
                    
                        VStack {
                            
                            HStack {
                                
                                VStack(spacing: 0) {
                                    
                                    Text("\(viewModel.sumRest)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 90, weight: .bold))
                                    
                                    Text("you visited")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                }
                                
                                Text("restaurants")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            .padding(.bottom, 90)
                            
                            NavigationLink(destination: {
                                
                                RestView()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                HStack(spacing: 0) {
                                    
                                    Text("TO RESTAURANTS")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                                    
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .regular))
                                        .padding()
                                        .background(Circle().fill(Color("prim2")))
                                }
                                
                            })

                        }
                    )
                                
            }
            .padding()
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
    HomeView()
}
