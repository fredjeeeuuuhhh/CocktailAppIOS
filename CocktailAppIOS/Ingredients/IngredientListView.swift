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
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .foregroundColor(viewModel.selectedCharacter == character ? Color.accentColor : Color.clear)
                                            )
                                    )
                                    .padding(2)
                                    .onTapGesture {
                                        withAnimation {
                                            viewModel.selectedCharacter = character
                                            viewModel.filterOnFirstCharacter(character)
                                        }
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
                viewModel.selectedCharacter = "a"
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
