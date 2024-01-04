//
//  IngredientCharacteristicRow.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 04/01/2024.
//

import SwiftUI

struct IngredientCharacteristicRow: View {
    let label: String
    let value: String
    var body: some View {
        VStack{
            Text(label)
                .bold()
                .font(.title3)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}


