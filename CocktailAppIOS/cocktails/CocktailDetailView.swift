//
//  CocktailDetailView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailDetailView: View {
    @StateObject var viewModel = CocktailDetailViewModel()
    let cocktailId: Int
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            ScrollView{
                DetailImage(url: viewModel.cocktail?.thumbNail ?? "")
                
                Text(viewModel.cocktail?.title ?? "")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                
                ingredientOverview
                
                Divider()
                    .foregroundColor(Color.accentColor)
                
                instructionOverview
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
        }
        .task {
            viewModel.getCocktailById(cocktailId)
        }
    }
    
    var ingredientOverview: some View{
        ForEach(0..<max(viewModel.cocktail?.ingredients?.count ?? 0, viewModel.cocktail?.measurements?.count ?? 0), id: \.self) { index in
            let ingredient = index < viewModel.cocktail?.ingredients!.count ?? 0 ? viewModel.cocktail?.ingredients![index] : nil
            let measurement = index < viewModel.cocktail?.measurements!.count ?? 0 ? viewModel.cocktail?.measurements![index] : nil
            
            if let ingredient = ingredient, let measurement = measurement {
                HStack{
                    DetailIngredientImage(url: "https://www.thecocktaildb.com/images/ingredients/\(ingredient)-Small.png")
                    
                    Text(ingredient)
                        .font(.title3)
                    
                    Spacer()
                        
                    Text(measurement)
                        .font(.title3)
                }
                .padding(.horizontal)
            }else if let ingredient = ingredient {
                HStack{
                    DetailIngredientImage(url: "https://www.thecocktaildb.com/images/ingredients/\(ingredient)-Small.png")
                    
                    Text(ingredient)
                        .font(.title3)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
    
    var instructionOverview: some View{
        ForEach(Array((viewModel.cocktail?.instructions?.split(separator: ", ") ?? []).enumerated()), id: \.offset) { index, instruction in
            HStack {
                Text("\(index + 1).")
                    .font(.title3)
                
                Text(String(instruction))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}


