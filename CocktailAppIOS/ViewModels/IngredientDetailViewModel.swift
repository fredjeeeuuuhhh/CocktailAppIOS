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
    @Published var isShowingCocktailDetail = false
    @Published var selectedCocktail: Cocktail?
    let ingredientName: String

    init(ingredientName: String){
        self.ingredient = nil
        self.cocktails = []
        self.alertItem = nil
        self.isShowingCocktailDetail = false
        self.selectedCocktail = nil
        self.ingredientName = ingredientName
    }
    
    func getIngredientByName(_ name: String) {
        Task{
            do{
                ingredient = try await NetworkManager.shared.getIngredientByName(name: name).mapToIngredient()
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
    
    func getCocktailsByIngredientName(_ name: String) {
        Task{
            do{
                let cocktailResponse = try await NetworkManager.shared.getCocktailsByIngredientName(name: name).mapToCocktails()
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
