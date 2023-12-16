//
//  ContentView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 14/12/2023.
//

import SwiftUI

struct CocktailAppContentView: View {
    var body: some View {
       
            TabView{
               
                ZStack{
                    LinearGradient(gradient: Gradient(colors:[.orange,.white]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                    CocktailsScreen()
                }
                .tabItem {
                    Image(systemName: "wineglass")
                    Text("Cocktails")
                }
                
                ZStack{
                    LinearGradient(gradient: Gradient(colors:[.orange,.white]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                    IngredientsScreen()
                }
                .tabItem {
                    Image(systemName: "basket")
                    Text("Ingredients")
                }
                
    
       
        }
    }
}
struct CocktailsScreen:View{
    var viewModel: CocktailViewModel = CocktailViewModel()
    var body : some View {
        ScrollView{
            CocktailCards(cocktails: viewModel.cocktails)
        }
       
    }
}
struct CocktailDetailView: View{
    var cocktail:CocktailModel.Cocktail
    var body: some View{
        VStack{
            Text(cocktail.title)
        }
    }
}

struct IngredientsScreen:View{
    var body : some View {
        ScrollView{
            Text("Ingredients")
        }
    }
}

struct CocktailCards:View{
    var cocktails: [CocktailModel.Cocktail]
    var body : some View{
        ScrollView{
            LazyHStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10)
             {
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth:2)
                    Text("Testggggg")
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0).strokeBorder(lineWidth:2)
                    Text("Testggggg")
                }
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth:2)
                    Text("Testggggg")
                }
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth:2)
                    Text("Testgggg")
                }
            }
        }
       
        Divider().frame(width: 380,height:3).background(.black)
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 125),spacing: 10)
            
        ]) {
            ForEach(cocktails){cocktail in
                CardView(cocktail: cocktail)
                    .aspectRatio(2/3,contentMode:.fit)
                    .padding(.horizontal)
            }
        }
    }
}

struct CardView:View{
    let cocktail: CocktailModel.Cocktail
    var body: some View{
        VStack{
            Image("preview")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
            Text(cocktail.title)
                .foregroundColor(.white)
                .padding(.vertical)
        }
        .background(.gray)
        .cornerRadius(6)
        .onTapGesture {
            
        }
       
    }
}

#Preview {
    CocktailAppContentView()
}
