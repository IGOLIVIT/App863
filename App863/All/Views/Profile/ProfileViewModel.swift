//
//  ProfileViewModel.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @Published var profPhoto: [String] = ["p1", "p2", "p3", "p4"]
    @Published var currentPPhoto = ""
    
    @AppStorage("PPhoto") var PPhoto: String = ""
    @AppStorage("PName") var PName: String = ""
    @Published var enterName = ""
    @AppStorage("age") var age: String = ""
    @Published var enterAge = ""

}

