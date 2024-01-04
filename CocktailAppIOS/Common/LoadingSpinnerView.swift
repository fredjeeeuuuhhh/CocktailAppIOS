//
//  LoadingSpinnerView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 30/12/2023.
//

import SwiftUI

struct LoadingSpinnerView: View{
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                .scaleEffect(2)
        }
    }
}
#Preview {
    LoadingSpinnerView()
}
