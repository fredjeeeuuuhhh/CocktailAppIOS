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
                filterView
                listView
            }
            .task{
                viewModel.selectedCharacter = "a"
                viewModel.getAllIngredients()
            }
            
            if viewModel.isLoading {
                LoadingSpinnerView()
            }
        }
        .sheet(isPresented: $viewModel.isShowingDetail){
            viewModel.isShowingDetail = false
        }  content:{
            IngredientDetailView(viewModel: IngredientDetailViewModel(ingredientName: viewModel.selectedIngredientName!))
                .presentationCornerRadius(8)
                .presentationDragIndicator(.visible)
        }
        .alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    var filterView: some View{
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(Alphabet.characters, id: \.self){
                    character in
                    FilterChip(character: character, selectedCharacter: $viewModel.selectedCharacter)
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
    }
    
    var listView: some View{
        List(viewModel.ingredients){ ingredient in
            IngredientListItem(ingredient: ingredient)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModel.selectedIngredientName = ingredient.name
                    viewModel.isShowingDetail = true
                }
        }
        .navigationTitle("Ingredients")
    }
}

#Preview {
    IngredientListView()
}
