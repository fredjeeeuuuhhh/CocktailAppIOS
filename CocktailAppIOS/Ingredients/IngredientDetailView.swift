//
//  IngredientDetailView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientDetailView: View {
    @StateObject var viewModel = IngredientDetailViewModel()
    let ingredientName: String
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    DetailImage(url: viewModel.ingredient?.thumbnail ?? "")
                    
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
            .frame(width: 300, height: 700)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button{
                isShowingDetail = false
            }label: {
                DetailCloseButton()
            }, alignment: .topTrailing)
            .task {
                viewModel.getIngredientByName(ingredientName)
                viewModel.getCocktailsByIngredientName(ingredientName)
            }
            
            if viewModel.isShowingCocktailDetail {
                CocktailDetailView(cocktailId: viewModel.selectedCocktail!.id, isShowingDetail: $viewModel.isShowingCocktailDetail)
            }
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
    IngredientDetailView(ingredientName: "Gin",isShowingDetail: .constant(true))
}
