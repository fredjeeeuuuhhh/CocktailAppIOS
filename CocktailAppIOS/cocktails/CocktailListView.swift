//
//  CocktailListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailListView: View {
    var body: some View {
        NavigationStack{
            List(CocktailMockData.sampleCocktails, id: \.idDrink){ cocktail in
               CocktailListItem(cocktail: cocktail)
            }
            .navigationTitle("Cocktails")
        }
    }
}

#Preview {
    CocktailListView()
}
