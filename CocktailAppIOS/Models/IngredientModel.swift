//
//  IngredientModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import Foundation

struct IngredientModel: Hashable, Identifiable{
    var id: Int
    var name: String
    var description: String
    var containsAlcohol: Bool
    var type: String
}
