//
//  ContentView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import SwiftUI

struct CocktailAppTabView: View {
    var body: some View {
            TabView{
                CocktailListView()
                .tabItem {
                    Image(systemName: "wineglass")
                    Text("Cocktails")
                }
                
                IngredientListView()
                .tabItem {
                    Image(systemName: "basket")
                    Text("Ingredients")
                }
            }
    }
}

#Preview {
    CocktailAppTabView()
}
