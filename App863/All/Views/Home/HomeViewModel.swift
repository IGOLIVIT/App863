//
//  HomeViewModel.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var isHome: Bool = false
    @Published var isRest: Bool = false
    @Published var isEat: Bool = false
    @Published var isSetting: Bool = false
    
    @Published var profPhoto: [String] = ["p1", "p2", "p3", "p4"]
    @Published var currentPPhoto = ""
    
    @AppStorage("sumRest") var sumRest: Int = 0
    
    @AppStorage("PPhoto") var PPhoto: String = ""
    @AppStorage("PName") var PName: String = ""
    @Published var enterName = ""
    @AppStorage("age") var age: String = ""
    @Published var enterAge = ""

}
