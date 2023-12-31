//
//  DetailIngredientImage.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 04/01/2024.
//

import SwiftUI

struct DetailIngredientImage: View {
    let url: String
    var body: some View {
        CocktailOrIngredientRemoteImage(urlString: url)
        .aspectRatio(contentMode: .fit)
        .frame(width: 35, height: 35)
        .cornerRadius(4)
    }
}

