//
//  IngredientDetailView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct IngredientDetailView: View {
    let ingredient: Ingredient
    @Binding var isShowingDetail: Bool
    var body: some View {
        VStack{
            ScrollView{
                Image("preview")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                VStack{
                    Text(ingredient.strIngredient)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    VStack(alignment: .leading, spacing: 5){
                        HStack(spacing: 5){
                            
                            Text("Type")
                                .bold()
                                .font(.title3)
                            
                            Text(ingredient.strType ?? "none")
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                                .italic()
                           
                        }
                        HStack(spacing: 5){
                            
                            Text("Contains alcohol")
                                .bold()
                                .font(.title3)
                           
                            Text(ingredient.strAlcohol ?? "none")
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                                .italic()
                            
                        }
                        HStack(spacing: 5){
                            Text("Alcohol percentage")
                                .bold()
                                .font(.title3)
                            Text(ingredient.strABV ?? "none")
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                                .italic()
                        }
                    }
                    .padding(.vertical)
                    
                    Divider()
                        .foregroundColor(.black)
                    
                    
                    if(ingredient.strDescription != nil){
                        Text(ingredient.strDescription!)
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
    }
}

#Preview {
    IngredientDetailView(ingredient: IngredientMockData.sampleIngredient,
                         isShowingDetail: .constant(true))
}
