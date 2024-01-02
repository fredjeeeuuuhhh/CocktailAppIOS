//
//  IngredientListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientListView: View {
    @StateObject var viewModel = IngredientListViewModel()
    var body: some View {
        ZStack{
            NavigationStack{
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(Alphabet.characters, id: \.self){
                            character in
                            Text(character)
                                .frame(width: 50, height: 25)
                                .cornerRadius(8)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                                .padding(2)
                                .onTapGesture {
                                    viewModel.filterOnFirstCharacter(character)
                                }
                        }
                    }
                }
                .frame(height: 50)
                List(viewModel.ingredients){ ingredient in
                    IngredientListItem(ingredient: ingredient)
                        .onTapGesture {
                            viewModel.selectedIngredientName = ingredient.name
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Ingredients")
                .disabled(viewModel.isShowingDetail)
            }
            .task{
                viewModel.getAllIngredients()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if(viewModel.isShowingDetail){
                IngredientDetailView(ingredientName: viewModel.selectedIngredientName!, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
        .alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
       
    }
}

#Preview {
    IngredientListView()
}
