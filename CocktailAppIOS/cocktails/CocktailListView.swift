//
//  CocktailListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailListView: View {
    @State private var isShowingDetail = false
    @State private var selectedCocktail: Cocktail?
    var body: some View {
        ZStack{
            NavigationStack{
                List(CocktailMockData.sampleCocktails, id: \.idDrink){ cocktail in
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
                // load cocktails async manner
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if(isShowingDetail){
                CocktailDetailView(cocktail: selectedCocktail!, isShowingDetail: $isShowingDetail)
            }
        }
    }
}

#Preview {
    CocktailListView()
}
