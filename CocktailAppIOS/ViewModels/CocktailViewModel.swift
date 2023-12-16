//
//  CocktailViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 15/12/2023.
//

import SwiftUI
import Foundation

class CocktailViewModel{
    private var model: CocktailModel = CocktailModel()
    
    var cocktails: [CocktailModel.Cocktail] {
        return model.cocktails
    }
    init() {
        model.setCocktails(cocktails: [cocktail1,cocktail2])
    }
    
        
    let cocktail1 = CocktailModel.Cocktail(id: 1, title: "Bacardi cola", thumbNail: "test", ingredients: ["Bacardi","Cola"], measurements: ["1oz","1oz"], instructions: "1 poor and mix", category: "Cocktail", alcoholicFilter: "Alcoholic", glass: "Cocktailglass")
    let cocktail2 = CocktailModel.Cocktail(id: 2, title: "Bacardi cola", thumbNail: "test", ingredients: ["Bacardi","Cola"], measurements: ["1oz","1oz"], instructions: "1 poor and mix", category: "Cocktail", alcoholicFilter: "Alcoholic", glass: "Cocktailglass")
}

