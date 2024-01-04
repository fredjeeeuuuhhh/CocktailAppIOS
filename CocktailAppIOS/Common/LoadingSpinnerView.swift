//
//  LoadingSpinnerView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 30/12/2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(Color.accentColor)
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingSpinnerView: View{
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ActivityIndicator()
        }
    }
}
#Preview {
    LoadingSpinnerView()
}
