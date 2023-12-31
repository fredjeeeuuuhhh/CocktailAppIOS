//
//  CocktailListItem.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailListItem: View{
    let cocktail: Cocktail
    var body: some View{
        HStack{
            AsyncImage(url: URL(string: cocktail.thumbNail)){ image in
                image
                    .resizable()
            } placeholder: {
                Image("preview")
                    .resizable()
                   
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 100,height: 100,alignment: .center)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    Spacer()
                    Text(cocktail.title)
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                }
               
                HStack(spacing: 5){
                   
                    Text("Category")
                        .bold()
                        .font(.body)
                    
                    Text(cocktail.category ?? "none")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                    Spacer()
                }
                HStack(spacing: 5){
                   
                    Text("Glass")
                        .bold()
                        .font(.body)
                    
                    Text(cocktail.glass ?? "none")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                    Spacer()
                }
                
                HStack(spacing: 5){
                    
                    Text("Alcoholic")
                        .bold()
                        .font(.body)
                    Text(cocktail.alcoholicFilter ?? "none")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                    Spacer()
                }
               
            }
           .padding(.horizontal)
            
           
        }
    }
}


