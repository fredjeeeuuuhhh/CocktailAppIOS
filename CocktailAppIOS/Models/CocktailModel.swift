//
//  CocktailModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import Foundation

struct ApiCocktail: Decodable{
    let idDrink: String
    let strDrink: String
    let strCategory: String?
    let strAlcohol: String?
    let strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
}

struct CocktailGetAllResponse: Decodable{
    let drinks: [ApiCocktail]
}

struct Cocktail: Identifiable{
    let id: Int
    let title: String
    let category: String?
    let alcoholicFilter: String?
    let glass: String?
    let instructions: String?
    let thumbNail: String
    let ingredients: [String]?
    let measurements: [String]?
}

struct CocktailMockData{
    static let sampleCocktail = Cocktail(id: 1, title: "Bacardi cola", category: "Cocktail", alcoholicFilter: "Contains alcohol", glass: "Cocktailglass", instructions: "1. poor and mix", thumbNail: "", ingredients: ["Bacardi","Cola"], measurements: ["1 oz","can"])
    
    static let sampleCocktails = [
        sampleCocktail
    ]
}
