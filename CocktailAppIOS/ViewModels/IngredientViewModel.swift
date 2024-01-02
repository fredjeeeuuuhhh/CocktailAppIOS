//
//  IngredientViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import Foundation

@MainActor class IngredientListViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    @Published var isShowingDetail = false
    @Published var selectedIngredientName: String?
    private var allIngredients: [Ingredient] = []
    func getAllIngredients(){
        isLoading = true
        Task{
            do{
                allIngredients = try await NetworkManager.shared.getAllIngredients().mapToIngredientNameOnly()
                filterOnFirstCharacter("a")
                isLoading = false
            } catch {
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
    
    func filterOnFirstCharacter(_ firstCharacter: String){
        ingredients = allIngredients.filter{ ingredient in
            ingredient.name.hasPrefix(firstCharacter.uppercased())
        }
    }
    
}
