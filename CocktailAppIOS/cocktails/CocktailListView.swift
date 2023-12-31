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
                        Text("a")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
                                viewModel.getAllCocktailsByFirstLetter(firstLetter: "a")
                            }
                        Text("b")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
                                viewModel.getAllCocktailsByFirstLetter(firstLetter: "b")
                            }
                        Text("c")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
    
                            }
                        Text("d")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
    
                            }
                        Text("e")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
    
                            }
                        Text("f")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
    
                            }
                        Text("g")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
    
                            }
                        Text("h")
                            .frame(width: 50, height: 25)
                            .cornerRadius(8)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(2)
                            .onTapGesture {
    
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
                viewModel.getAllCocktailsByFirstLetter(firstLetter: "a")
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isLoading {
                LoadingSpinnerView()
            }
            
            if viewModel.isShowingDetail {
                CocktailDetailView(cocktail: viewModel.selectedCocktail!, isShowingDetail: $viewModel.isShowingDetail)
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
