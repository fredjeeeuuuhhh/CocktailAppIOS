//
//  IngredientModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import Foundation

struct Ingredient: Decodable{
    let idIngredient: String
    let strIngredient: String
    let strDescription: String?
    let strType: String?
    let strAlcohol: String?
    let strABV: String?
}

struct IngredientResponse{
    let ingredients: [Ingredient]
}

struct IngredientMockData{
    static let sampleIngredient = Ingredient(idIngredient: "1", strIngredient: "Cola", strDescription: "Coca Cola 33cl", strType: "Soda", strAlcohol: "No", strABV: nil)
    
    static let sampleIngredients = [
        sampleIngredient,
        Ingredient(idIngredient: "2", strIngredient: "Bacardi", strDescription: "Bacardi white", strType: "Bacardi", strAlcohol: "Yes", strABV: "40"),
        Ingredient(idIngredient: "3", strIngredient: "Redbull", strDescription: "Gives you wings", strType: "Soda", strAlcohol: "No", strABV: nil),
        Ingredient(idIngredient: "4", strIngredient: "Vodka", strDescription: "Eristof Vodka white", strType: "Vodka", strAlcohol: "Yes", strABV: "40")
    ]
}
