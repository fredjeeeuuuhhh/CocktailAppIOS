//
//  IngredientListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientListView: View {
    @State private var isShowingDetail = false
    @State private var selectedIngredient: Ingredient?
    var body: some View {
        ZStack{
            NavigationStack{
                List(IngredientMockData.sampleIngredients,id: \.strIngredient){ ingredient in
                    IngredientListItem(ingredient: ingredient)
                        .onTapGesture {
                            selectedIngredient = ingredient
                            isShowingDetail = true
                        }
                }
                .navigationTitle("Ingredients")
                .disabled(isShowingDetail)
            } 
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if(isShowingDetail){
                IngredientDetailView(ingredient: selectedIngredient!, isShowingDetail: $isShowingDetail)
            }
        }
       
    }
}

#Preview {
    IngredientListView()
}
