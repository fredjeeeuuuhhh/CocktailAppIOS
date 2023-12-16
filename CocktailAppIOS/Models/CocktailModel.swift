//
//  CocktailModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import Foundation
//Normaal zou ingredient Ingredient struct hebben, maar api is niet optimaal
struct CocktailModel{
    private(set) var cocktails: [Cocktail]
    
    init(){
        cocktails = []
    }
    mutating func setCocktails(cocktails:[Cocktail]){
        for cocktail in cocktails {
            self.cocktails.append(cocktail)
        }
    }
    struct Cocktail: Hashable,Identifiable{
        var id: Int
        var title: String
        var thumbNail: String
        var ingredients: [String]
        var measurements: [String]
        var instructions: String
        var category: String
        var alcoholicFilter: String
        var glass: String
    }
}


