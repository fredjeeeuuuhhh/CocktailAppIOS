//
//  CocktailListView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailListView: View {
    var body: some View {
        NavigationStack{
            Text("Cocktails!")
            .navigationTitle(" Cocktails")
        }
    }
}

#Preview {
    CocktailListView()
}
