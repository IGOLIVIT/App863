//
//  SettingsView.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(spacing: 19) {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(width: 20, height: 20)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.white))
                                
                                Text("Rate us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Rate")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(6)
                                    .padding(.horizontal, 9)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                                
                            }
                            .padding(30)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/aa953279-982a-4d89-b33d-15be7177e49a") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack(spacing: 19) {
                                
                                Image(systemName: "person.badge.shield.checkmark.fill")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 22, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Read")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .padding(6)
                                    .padding(.horizontal, 9)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                                
                            }
                            .padding(30)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                        })
                        
                    }
                }
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
    SettingsView()
}
