//
//  IngredientListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientListView: View {
    var body: some View {
        NavigationStack{
            Text("Ingredients!")
                .navigationTitle("Ingredients")
        }
       
    }
}

#Preview {
    IngredientListView()
}
