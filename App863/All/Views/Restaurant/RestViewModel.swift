//
//  RestViewModel.swift
//  App863
//
//  Created by IGOR on 26/08/2024.
//

import SwiftUI
import CoreData

final class RestViewModel: ObservableObject {
    
    @Published var isHome: Bool = false
    @Published var isRest: Bool = false
    @Published var isEat: Bool = false
    @Published var isSetting: Bool = false
    
    @AppStorage("sumRest") var sumRest: Int = 0
    
    @Published var resPhotos: [String] = ["Breakfast", "Dinner", "Supper"]
    @Published var currentResPhoto = ""
    @Published var currentFoodPhoto = ""
    
    @Published var profPhoto: [String] = ["p1", "p2", "p3", "p4"]
    @Published var currentPPhoto = ""
    
    @AppStorage("PPhoto") var PPhoto: String = ""
    @AppStorage("PName") var PName: String = ""
    @Published var enterName = ""
    @AppStorage("age") var age: String = ""
    @Published var enterAge = ""

    @Published var isAdd: Bool = false
    @Published var isAddFood: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var resPhoto: String = ""
    @Published var resName: String = ""
    @Published var resRate: String = ""

    @Published var restaurants: [RestModel] = []
    @Published var selectedRestaurant: RestModel?
    
    func addRestaurant() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "RestModel", into: context) as! RestModel

        loan.resPhoto = resPhoto
        loan.resName = resName
        loan.resRate = resRate

        CoreDataStack.shared.saveContext()
    }

    func fetchRestaurants() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RestModel>(entityName: "RestModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.restaurants = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.restaurants = []
        }
    }
    
    @Published var foodPhoto: String = ""
    @Published var foodName: String = ""
    @Published var foodRate: String = ""
    @Published var foodCost: String = ""
    @Published var foodRest: String = ""
    
    @Published var foods: [FoodModel] = []
    @Published var selectedFood: FoodModel?
    
    func addFood() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FoodModel", into: context) as! FoodModel

        loan.foodPhoto = foodPhoto
        loan.foodName = foodName
        loan.foodRate = foodRate
        loan.foodCost = foodCost
        loan.foodRest = foodRest

        CoreDataStack.shared.saveContext()
    }

    func fetchFoods() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FoodModel>(entityName: "FoodModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.foods = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.foods = []
        }
    }
}

