//
//  IngredientDetailViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 01/01/2024.
//

import Foundation

@MainActor final class IngredientDetailViewModel: ObservableObject{
    @Published var ingredient: Ingredient?
    @Published var cocktails: [Cocktail] = []
    @Published var alertItem: AlertItem?

    let ingredientName: String

    init(ingredientName: String){
        self.ingredient = nil
        self.cocktails = []
        self.alertItem = nil
        self.ingredientName = ingredientName
    }
    
    func getIngredientByName() {
        Task{
            do{
                ingredient = try await NetworkManager.shared.getIngredientByName(name: ingredientName).mapToIngredient()
            }catch{
                if let cocktailError = error as? CocktailError{
                    switch cocktailError{
                    case .invalidURL:
                        alertItem = AlertContext.invalidUrl
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
    
    func getCocktailsByIngredientName() {
        Task{
            do{
                let cocktailResponse = try await NetworkManager.shared.getCocktailsByIngredientName(name: ingredientName).mapToCocktails()
                cocktails = cocktailResponse
            }catch{
                if let cocktailError = error as? CocktailError{
                    switch cocktailError{
                    case .invalidURL:
                        alertItem = AlertContext.invalidUrl
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }

}
