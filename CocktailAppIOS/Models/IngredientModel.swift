//
//  IngredientModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import Foundation

struct ApiIngredient: Decodable{
    let idIngredient: String
    let strIngredient: String
    let strDescription: String?
    let strType: String?
    let strAlcohol: String?
    let strABV: String?
}

struct ApiIngredientName: Decodable{
    let strIngredient1: String
}

struct IngredientListResponse: Decodable{
    let drinks: [ApiIngredientName]
}

struct IngredientResponse: Decodable{
    let ingredients: [ApiIngredient]
}

struct Ingredient: Identifiable{
    let id: String
    let name: String
    let description: String?
    let type: String?
    let containsAlcohol: Bool
    let alcoholPercentage: String?
    let thumbnail: String
}

struct IngredientMockData{
    static let sampleIngredient = Ingredient(id: "1", name: "Cola", description: "Coca cola", type: "Soda", containsAlcohol: false, alcoholPercentage: nil, thumbnail: "")

    static let sampleIngredients = [
        sampleIngredient
    ]
}
