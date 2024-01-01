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
extension [ApiIngredientName] {
    func ingredientListToIngredientNameOnly() -> [Ingredient]{
        return self.map{
            ingredient in
            Ingredient(id: ingredient.strIngredient1, name: ingredient.strIngredient1, description: nil, type: nil, containsAlcohol: false, alcoholPercentage: nil, thumbnail: "https://www.thecocktaildb.com/images/ingredients/\(ingredient.strIngredient1)-Small.png")
        }
    }
}

extension ApiIngredient {
    func mapToIngredient() -> Ingredient{
        return Ingredient(id: self.idIngredient, name: self.strIngredient, description: self.strDescription, type: self.strType, containsAlcohol: self.strAlcohol ?? "" == "Yes" ? true : false, alcoholPercentage: self.strABV, thumbnail: "https://www.thecocktaildb.com/images/ingredients/\(self.strIngredient)-Small.png")
    }
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
struct IngredientResponse: Decodable{
    let ingredients: [ApiIngredient]
}

struct IngredientMockData{
    static let sampleIngredient = Ingredient(id: "1", name: "Cola", description: "Coca cola", type: "Soda", containsAlcohol: false, alcoholPercentage: nil, thumbnail: "")

    static let sampleIngredients = [
        sampleIngredient
    ]
}
