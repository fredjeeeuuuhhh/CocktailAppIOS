//
//  ContentView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Group{
                CocktailsScreen()
                    .tabItem {
                        Image(systemName: "wineglass")
                        Text("Cocktails")
                    }
                IngredientsScreen()
                    .tabItem {
                        Image(systemName: "basket")
                        Text("Ingredients")
                    }
                   
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(
                Color.black,
                for: .tabBar
            )
        }
        .tint(.red)
    }
}
struct CocktailsScreen:View{
    var body : some View {
        VStack{
            ScrollView{
                CocktailCards()
            }
        }
    }
}
struct IngredientsScreen:View{
    var body : some View {
        VStack{
            ScrollView{
                CocktailCards()
            }
        }
    }
}

struct CocktailCards:View{
    var body : some View{
        LazyVGrid(columns: [
            GridItem(.fixed(150)),
            GridItem(.fixed(150))
        ]) {
            ForEach(0..<10,id: \.self){index in
                CardView(title: "Bacardi Cola")
                    .padding(10)
                    .aspectRatio(2/3,contentMode:.fit)
                    
            }
        }
    }
}

struct CardView:View{
    var title = ""
    var image = ""
    var body: some View{
        VStack{
            Image("preview")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            Text(title)
                .foregroundColor(.white)
                .padding(.vertical)
        }
        .background(.gray)
        .cornerRadius(6)
        .onTapGesture {
            print("Tapped")
        }
       
    }
}

#Preview {
    ContentView()
}
