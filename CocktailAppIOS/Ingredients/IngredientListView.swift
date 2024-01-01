//
//  IngredientListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientListView: View {
    @StateObject var viewModel = IngredientListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedIngredientName: String?
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.ingredients){ ingredient in
                    IngredientListItem(ingredient: ingredient)
                        .onTapGesture {
                            selectedIngredientName = ingredient.name
                            isShowingDetail = true
                        }
                }
                .navigationTitle("Ingredients")
                .disabled(isShowingDetail)
            } 
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if(isShowingDetail){
                IngredientDetailView(ingredientName: selectedIngredientName!, isShowingDetail: $isShowingDetail)
            }
        }
       
    }
}

#Preview {
    IngredientListView()
}
