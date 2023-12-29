//
//  CocktailModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import Foundation

struct Cocktail: Decodable{
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

struct CocktailGetAllResponse{
    let drinks: [Cocktail]
}

struct CocktailMockData{
    static let sampleCocktail = Cocktail(idDrink: "1",strDrink: "Bacardi Cola", strCategory: "Cocktail",strAlcohol: "Alcohol", strGlass: "Cocktail glass", strInstructions: "1. Poor in a glass and mix", strDrinkThumb: "",strIngredient1: "Bacardi",strIngredient2: "Cola",strIngredient3: nil,strIngredient4:nil,strIngredient5:nil,strIngredient6:nil,strIngredient7:nil,strIngredient8:nil,strIngredient9:nil,strIngredient10:nil,strIngredient11:nil,strIngredient12:nil,strIngredient13:nil,strIngredient14:nil,strIngredient15:nil,strMeasure1: "1 oz", strMeasure2: "Can",strMeasure3: nil,strMeasure4: nil,strMeasure5: nil,strMeasure6: nil,strMeasure7: nil,strMeasure8: nil,strMeasure9: nil,strMeasure10: nil,strMeasure11: nil,strMeasure12: nil,strMeasure13: nil,strMeasure14: nil,strMeasure15: nil)
    
    static let sampleCocktails = [
        sampleCocktail,
        Cocktail(idDrink: "2",strDrink: "Vodka Redbull", strCategory: "Cocktail",strAlcohol: "Alcohol", strGlass: "Cocktail glass", strInstructions: "1. Poor in a glass and mix", strDrinkThumb: "",strIngredient1: "Vodka",strIngredient2: "Redbull",strIngredient3: nil,strIngredient4:nil,strIngredient5:nil,strIngredient6:nil,strIngredient7:nil,strIngredient8:nil,strIngredient9:nil,strIngredient10:nil,strIngredient11:nil,strIngredient12:nil,strIngredient13:nil,strIngredient14:nil,strIngredient15:nil,strMeasure1: "1 oz", strMeasure2: "Can",strMeasure3: nil,strMeasure4: nil,strMeasure5: nil,strMeasure6: nil,strMeasure7: nil,strMeasure8: nil,strMeasure9: nil,strMeasure10: nil,strMeasure11: nil,strMeasure12: nil,strMeasure13: nil,strMeasure14: nil,strMeasure15: nil)
        ,
        Cocktail(idDrink: "3",strDrink: "Rum Cola", strCategory: "Cocktail",strAlcohol: "Alcohol", strGlass: "Cocktail glass", strInstructions: "1. Poor in a glass and mix", strDrinkThumb: "",strIngredient1: "Rum",strIngredient2: "Cola",strIngredient3: nil,strIngredient4:nil,strIngredient5:nil,strIngredient6:nil,strIngredient7:nil,strIngredient8:nil,strIngredient9:nil,strIngredient10:nil,strIngredient11:nil,strIngredient12:nil,strIngredient13:nil,strIngredient14:nil,strIngredient15:nil,strMeasure1: "1 oz", strMeasure2: "Can",strMeasure3: nil,strMeasure4: nil,strMeasure5: nil,strMeasure6: nil,strMeasure7: nil,strMeasure8: nil,strMeasure9: nil,strMeasure10: nil,strMeasure11: nil,strMeasure12: nil,strMeasure13: nil,strMeasure14: nil,strMeasure15: nil)
    ]
}
