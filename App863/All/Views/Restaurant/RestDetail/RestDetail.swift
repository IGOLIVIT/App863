//
//  RestDetail.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct RestDetail: View {
    
    @StateObject var viewModel: RestViewModel

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text(viewModel.selectedRestaurant?.resName ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                                                                    
                            VStack {
                                
                                Image(viewModel.selectedRestaurant?.resPhoto ?? "")
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                
                                HStack {
                                    
                                    Text(viewModel.selectedRestaurant?.resName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Image("stars")
                                    
                                    Text(viewModel.selectedRestaurant?.resRate ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .semibold))
                                }
                                .padding(.horizontal)
                                
                                HStack {
                                    
                                    Text("What did you eat?")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAddFood = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .medium))
                                            .padding(6)
                                            .background(Circle().fill(Color("prim")))
                                    })
                                }
                                .padding(.vertical)
                                
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                    
                                    ForEach(viewModel.foods.filter{($0.foodRest ?? "") == (viewModel.selectedRestaurant?.resName ?? "")}, id: \.self) { index in
                                    
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
        .sheet(isPresented: $viewModel.isAddFood, content: {
            
            AddFood(viewModel: viewModel)
        })
    }
}

#Preview {
    RestDetail(viewModel: RestViewModel())
}
