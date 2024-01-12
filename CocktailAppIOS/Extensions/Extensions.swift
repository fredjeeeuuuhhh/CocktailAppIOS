//
//  Extensions.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 02/01/2024.
//

import Foundation

extension [ApiCocktail] {
    func mapToCocktails() -> [Cocktail] {
        return self.map{ apiCocktail in
            Cocktail(id: Int(apiCocktail.idDrink)!, title: apiCocktail.strDrink, category: apiCocktail.strCategory, alcoholicFilter: apiCocktail.strAlcoholic, glass: apiCocktail.strGlass, instructions: apiCocktail.strInstructions, thumbNail: apiCocktail.strDrinkThumb + "/preview", ingredients: [
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

extension [ApiIngredientName] {
    func mapToIngredientNameOnly() -> [Ingredient]{
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
