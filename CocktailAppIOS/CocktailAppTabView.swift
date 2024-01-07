//
//  ContentView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import SwiftUI

struct CocktailAppTabView: View {
    @Environment(\.verticalSizeClass)var verticalSizeClass
    
    var body: some View {
        if verticalSizeClass == .compact{
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
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }else{
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
}

#Preview {
    CocktailAppTabView()
}
