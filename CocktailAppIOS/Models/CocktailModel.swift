//
//  CocktailModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import Foundation

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

extension [ApiCocktail] {
    func mapToCocktails() -> [Cocktail] {
        return self.map{ apiCocktail in
            Cocktail(id: Int(apiCocktail.idDrink)!, title: apiCocktail.strDrink, category: apiCocktail.strCategory, alcoholicFilter: apiCocktail.strAlcohol, glass: apiCocktail.strGlass, instructions: apiCocktail.strInstructions, thumbNail: apiCocktail.strDrinkThumb + "/preview", ingredients: [
                apiCocktail.strIngredient1,
                apiCocktail.strIngredient2,
                apiCocktail.strIngredient3,
                apiCocktail.strIngredient4,
                apiCocktail.strIngredient5,
                apiCocktail.strIngredient6,
                apiCocktail.strIngredient7,
                apiCocktail.strIngredient8,
                apiCocktail.strIngredient9,
                apiCocktail.strIngredient10,
                apiCocktail.strIngredient11,
                apiCocktail.strIngredient12,
                apiCocktail.strIngredient13,
                apiCocktail.strIngredient14,
                apiCocktail.strIngredient15,
                ].compactMap { $0 },
                measurements: [
                    apiCocktail.strMeasure1,
                    apiCocktail.strMeasure2,
                    apiCocktail.strMeasure3,
                    apiCocktail.strMeasure4,
                    apiCocktail.strMeasure5,
                    apiCocktail.strMeasure6,
                    apiCocktail.strMeasure7,
                    apiCocktail.strMeasure8,
                    apiCocktail.strMeasure9,
                    apiCocktail.strMeasure10,
                    apiCocktail.strMeasure11,
                    apiCocktail.strMeasure12,
                    apiCocktail.strMeasure13,
                    apiCocktail.strMeasure14,
                    apiCocktail.strMeasure15
                ].compactMap { $0 }
            )
        }
        
    }
}

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

struct CocktailMockData{
    static let sampleCocktail = Cocktail(id: 1, title: "Bacardi cola", category: "Cocktail", alcoholicFilter: "Contains alcohol", glass: "Cocktailglass", instructions: "1. poor and mix", thumbNail: "", ingredients: ["Bacardi","Cola"], measurements: ["1 oz","can"])
    
    static let sampleCocktails = [
        sampleCocktail
    ]
}
