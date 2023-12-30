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
            AsyncImage(url: URL(string: cocktail.strDrinkThumb+"/preview")){ image in
                image
                    .resizable()
            } placeholder: {
                Image("preview")
                    .resizable()
                   
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 100,height: 100,alignment: .center)
            .cornerRadius(8)
            
            Spacer()
            Text(cocktail.strDrink)
                .font(.title2)
                .fontWeight(.medium)
            Spacer()
        }
    }
}

#Preview {
    CocktailListItem(cocktail: CocktailMockData.sampleCocktail)
}
