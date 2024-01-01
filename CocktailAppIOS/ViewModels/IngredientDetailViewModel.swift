//
//  IngredientDetailViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 01/01/2024.
//

import Foundation

class IngredientDetailViewModel: ObservableObject{
    @Published var ingredient: Ingredient?
    
    func getIngredientByName(name: String) {
        Task{
            do{
                let ingredientResponse = try await NetworkManager.shared.getIngredientByName(name: name).mapToIngredient()
                ingredient = ingredientResponse
            }catch{
                
            }
        }
    }
}
