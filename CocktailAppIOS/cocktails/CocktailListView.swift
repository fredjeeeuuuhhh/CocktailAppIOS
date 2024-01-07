//
//  CocktailListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailListView: View {
    @StateObject var viewModel = CocktailListViewModel()
   
    var body: some View {
        ZStack{
            NavigationStack{
                filterView
                listView
            }
            .task {
                viewModel.selectedCharacter = "a"
                viewModel.getAllCocktailsByFirstLetter(firstLetter: "a")
            }
           
            if viewModel.isLoading {
                LoadingSpinnerView()
            }
        }
        .sheet(isPresented: $viewModel.isShowingDetail){
            viewModel.isShowingDetail = false
        } content: {
            CocktailDetailView(viewModel: CocktailDetailViewModel(cocktailId: viewModel.selectedCocktail!.id),isShowingDetail: $viewModel.isShowingDetail)
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
                ForEach(Alphabet.characters, id: \.self) { character in
                    FilterChip(character: character, selectedCharacter: $viewModel.selectedCharacter)
                        .onTapGesture {
                            withAnimation {
                                viewModel.selectedCharacter = character
                                viewModel.getAllCocktailsByFirstLetter(firstLetter: character)
                            }
                        }
                }
            }
        }
        .frame(height: 50)
    }
    @ViewBuilder
    var listView: some View{
        if viewModel.cocktails.isEmpty{
            Text("No cocktails that start with \(viewModel.selectedCharacter)")
        }
        List(viewModel.cocktails){ cocktail in
           CocktailListItem(cocktail: cocktail)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModel.selectedCocktail = cocktail
                    viewModel.isShowingDetail = true
                }
        }
    }
}

#Preview {
    CocktailListView()
}
