//
//  AddFood.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct AddFood: View {

    @StateObject var viewModel: RestViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 40, height: 4)
                
                Text("Food")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.resPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentFoodPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentFoodPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 70, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.gray))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentFoodPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .cornerRadius(25)
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.foodName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.foodName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        .padding(1)
                        
                        Text("How do you rate a food?")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Image("stars")
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.foodRate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.foodRate)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                            .padding(1)
                        }
                        
                        Text("Cost")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.foodCost.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.foodCost)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        .padding(1)

                    }
                }
                
                HStack {
                    
                    Button(action: {
                        
                        viewModel.foodName = ""
                        viewModel.foodRate = ""
                        viewModel.foodCost = ""
                        viewModel.currentFoodPhoto = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddFood = false
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim2")))
                    })
                    
                    Button(action: {
                        
                        viewModel.foodRest = viewModel.selectedRestaurant?.resName ?? ""
                        
                        viewModel.foodPhoto = viewModel.currentFoodPhoto
                        
                        viewModel.addFood()
                        
                        viewModel.foodName = ""
                        viewModel.foodRate = ""
                        viewModel.foodCost = ""
                        viewModel.currentFoodPhoto = ""
                        
                        viewModel.fetchFoods()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddFood = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(viewModel.foodName.isEmpty || viewModel.foodRate.isEmpty || viewModel.foodCost.isEmpty ? Color("prim").opacity(0.5) : Color("prim2")))
                    })
                    .disabled(viewModel.foodName.isEmpty || viewModel.foodRate.isEmpty || viewModel.foodCost.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddFood(viewModel: RestViewModel())
}
