//
//  CocktailDetailView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailDetailView: View {
    let cocktail: Cocktail
    @Binding var isShowingDetail: Bool
    var body: some View {
        
        VStack{
            Image("preview")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            VStack{
                Text(cocktail.strDrink)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                
                VStack(alignment: .leading, spacing: 5){
                    HStack(spacing: 5){
                        
                        Text("Category")
                            .bold()
                            .font(.title3)
                        
                        Text(cocktail.strCategory ?? "none")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                       
                    }
                    HStack(spacing: 5){
                        
                        Text("Glass")
                            .bold()
                            .font(.title3)
                       
                        Text(cocktail.strGlass ?? "none")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                        
                    }
                    HStack(spacing: 5){
                        Text("Alcoholic")
                            .bold()
                            .font(.title3)
                        Text(cocktail.strAlcohol ?? "none")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
                .padding(.vertical)
                
                HStack{
                    Image("preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                    Text(cocktail.strIngredient1 ?? "")
                        .font(.title3)
                    Spacer()
                    Text(cocktail.strMeasure1 ?? "")
                        .font(.title3)
                }
                .padding(.horizontal)
                HStack{
                    Image("preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                    Text(cocktail.strIngredient2 ?? "")
                        .font(.title3)
                    Spacer()
                    Text(cocktail.strMeasure2 ?? "")
                        .font(.title3)
                }
                .padding(.horizontal)
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


