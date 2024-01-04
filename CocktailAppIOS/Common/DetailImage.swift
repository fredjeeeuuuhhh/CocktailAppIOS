//
//  DetailImage.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 04/01/2024.
//

import SwiftUI

struct DetailImage: View {
    let url: String
    var body: some View {
        if url != ""{
            CocktailOrIngredientRemoteImage(urlString: url)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
        }
    }
}


