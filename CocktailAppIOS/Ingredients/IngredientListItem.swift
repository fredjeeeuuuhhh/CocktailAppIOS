//
//  IngredientListItem.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientListItem: View {
    let ingredient: Ingredient
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: ingredient.thumbnail)){ image in
                image
                    .resizable()
            } placeholder: {
                Image("preview")
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(8)
            Spacer()
            Text(ingredient.name)
                .font(.title)
                .fontWeight(.medium)
            Spacer()
        }
    }
}

#Preview {
    IngredientListItem(ingredient: IngredientMockData.sampleIngredient)
}
