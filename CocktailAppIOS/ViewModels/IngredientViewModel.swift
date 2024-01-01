//
//  IngredientViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import Foundation

class IngredientListViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = []
}
