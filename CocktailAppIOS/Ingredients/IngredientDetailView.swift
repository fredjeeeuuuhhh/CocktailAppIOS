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
        VStack{
            ScrollView{
                Image("preview")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                VStack{
                    Text(viewModel.ingredient?.name ?? "")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    VStack(alignment: .leading, spacing: 5){
                        HStack(spacing: 5){
                            
                            Text("Type")
                                .bold()
                                .font(.title3)
                            
                            Text(viewModel.ingredient?.type ?? "none")
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                                .italic()
                           
                        }
                        HStack(spacing: 5){
                            
                            Text("Contains alcohol")
                                .bold()
                                .font(.title3)
                           
                            Text(viewModel.ingredient?.containsAlcohol  == true ? "Yes" : "No")
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                                .italic()
                            
                        }
                        HStack(spacing: 5){
                            Text("Alcohol percentage")
                                .bold()
                                .font(.title3)
                            Text(viewModel.ingredient?.alcoholPercentage ?? "none")
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                                .italic()
                        }
                    }
                    .padding(.vertical)
                    
                    Divider()
                        .foregroundColor(.black)
                    
                    
                    if(viewModel.ingredient?.description != nil){
                        Text(viewModel.ingredient?.description! ?? "")
                            .multilineTextAlignment(.center)
                        Divider()
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(CocktailMockData.sampleCocktails){
                                cocktail in
                                VStack{
                                    Image("preview")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                    Text(cocktail.title)
                                }
                            }
                        }
                    }
                    .padding()
                  
                }
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
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
        .task {
            viewModel.getIngredientByName(name: ingredientName)
        }
    }
}

#Preview {
    IngredientDetailView(ingredientName: "Gin",isShowingDetail: .constant(true))
}
