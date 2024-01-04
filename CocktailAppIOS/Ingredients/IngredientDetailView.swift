//
//  IngredientDetailView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientDetailView: View {
    @ObservedObject var viewModel: IngredientDetailViewModel
   
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    DetailImage(url: viewModel.ingredient?.thumbnail ?? "")
                        .padding(.vertical)
                    
                    Text(viewModel.ingredient?.name ?? "")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    characteristics
                    
                    Divider()
                        .foregroundColor(.accentColor)
                    
                    if(viewModel.ingredient?.description != nil){
                        Text(viewModel.ingredient?.description! ?? "")
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                        
                        Divider()
                            .foregroundColor(.accentColor)
                    }
                    
                    Spacer()
                    
                    cocktailOverview
                    
                    Spacer()
                }
            }
            .background(Color(.systemBackground))
            .task {
                viewModel.getIngredientByName(viewModel.ingredientName)
                viewModel.getCocktailsByIngredientName(viewModel.ingredientName)
            }
        }
        .sheet(isPresented: $viewModel.isShowingCocktailDetail){
            viewModel.isShowingCocktailDetail = false
        } content: {
            CocktailDetailView(viewModel: CocktailDetailViewModel(cocktailId: viewModel.selectedCocktail!.id))
                .presentationDetents([.medium])
                .presentationCornerRadius(4)
                .presentationDragIndicator(.visible)
        }
        .alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    var cocktailOverview: some View{
        ScrollView(.horizontal){
            LazyHStack{
                ForEach(viewModel.cocktails){
                    cocktail in
                    VStack{
                        AsyncImage(url: URL(string: cocktail.thumbNail)){ image in
                            image
                                .resizable()
                        } placeholder: {
                            Image("preview")
                                .resizable()
                        }
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        
                        Text(cocktail.title)
                            .multilineTextAlignment(.center)
                    }
                    .onTapGesture {
                        viewModel.selectedCocktail = cocktail
                        viewModel.isShowingCocktailDetail = true
                    }
                }
            }
        }
        .padding()
    }
    
    var characteristics: some View{
        HStack(alignment: .center, spacing: 20){
            IngredientCharacteristicRow(label: "Type", value: viewModel.ingredient?.type ?? "none")
            
            IngredientCharacteristicRow(label: "Alcohol", value: viewModel.ingredient?.containsAlcohol  == true ? "Yes" : "No")
            
            IngredientCharacteristicRow(label: "ABV", value: viewModel.ingredient?.alcoholPercentage ?? "none")
        }
        .padding(.vertical)
    }
}

#Preview {
    IngredientDetailView(viewModel: IngredientDetailViewModel(ingredientName: "Gin"))
}
