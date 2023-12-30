//
//  CocktailListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailListView: View {
    @StateObject var viewModel = CocktailListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedCocktail: Cocktail?
   
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.cocktails, id: \.idDrink){ cocktail in
                   CocktailListItem(cocktail: cocktail)
                        .onTapGesture {
                            selectedCocktail = cocktail
                            isShowingDetail = true
                        }
                }
                .navigationTitle("Cocktails")
                .disabled(isShowingDetail)
            }
            .task {
                viewModel.getAllCocktailsByFirstLetter(firstLetter: "a")
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if viewModel.isLoading {
                LoadingSpinnerView()
            }
            
            if isShowingDetail {
                CocktailDetailView(cocktail: selectedCocktail!, isShowingDetail: $isShowingDetail)
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
