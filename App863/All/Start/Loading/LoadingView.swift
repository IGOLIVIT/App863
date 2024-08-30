//
//  LoadingView.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("lbg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
            
            VStack {
                
                ProgressView()
                    .padding(.top, 290)
            }
        }
    }
}

#Preview {
    LoadingView()
}
