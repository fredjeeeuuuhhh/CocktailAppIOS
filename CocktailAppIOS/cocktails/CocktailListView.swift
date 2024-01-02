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
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(Alphabet.characters, id: \.self) { character in
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
                                            viewModel.getAllCocktailsByFirstLetter(firstLetter: character)
                                        }
                                    }
                        }
                    }
                }
                .frame(height: 50)
                List(viewModel.cocktails){ cocktail in
                   CocktailListItem(cocktail: cocktail)
                        .onTapGesture {
                            viewModel.selectedCocktail = cocktail
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Cocktails")
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.selectedCharacter = "a"
                viewModel.getAllCocktailsByFirstLetter(firstLetter: "a")
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isLoading {
                LoadingSpinnerView()
            }
            
            if viewModel.isShowingDetail {
                CocktailDetailView(cocktailId: viewModel.selectedCocktail!.id, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
        .alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    CocktailListView()
}
