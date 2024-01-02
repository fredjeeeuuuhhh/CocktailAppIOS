//
//  CocktailDetailView.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 29/12/2023.
//

import SwiftUI

struct CocktailDetailView: View {
    @StateObject var viewModel = CocktailDetailViewModel()
    let cocktailId: Int
    @Binding var isShowingDetail: Bool
    var body: some View {
        VStack{
            ScrollView{
                AsyncImage(url: URL(string: viewModel.cocktail?.thumbNail ?? "")){ image in
                    image
                        .resizable()
                } placeholder: {
                    Image("preview")
                        .resizable()
                       
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                
                VStack{
                    Text(viewModel.cocktail?.title ?? "")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    ForEach(0..<max(viewModel.cocktail?.ingredients?.count ?? 0, viewModel.cocktail?.measurements?.count ?? 0), id: \.self) { index in
                        let ingredient = index < viewModel.cocktail?.ingredients!.count ?? 0 ? viewModel.cocktail?.ingredients![index] : nil
                        let measurement = index < viewModel.cocktail?.measurements!.count ?? 0 ? viewModel.cocktail?.measurements![index] : nil
                        
                        if let ingredient = ingredient, let measurement = measurement {
                            HStack{
                                AsyncImage(url: URL(string: "https://www.thecocktaildb.com/images/ingredients/\(ingredient)-Small.png")){ image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    Image("preview")
                                        .resizable()
                                       
                                }
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .cornerRadius(4)
                                
                                Text(ingredient)
                                    .font(.title3)
                                Spacer()
                                Text(measurement)
                                    .font(.title3)
                            }
                            .padding(.horizontal)
                        }else if let ingredient = ingredient {
                            HStack{
                                Image("preview")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                Text(ingredient)
                                    .font(.title3)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                Divider()
                ForEach(Array((viewModel.cocktail?.instructions?.split(separator: ", ") ?? []).enumerated()), id: \.offset) { index, instruction in
                    
                    HStack {
                        Text("\(index + 1).")
                            .font(.title3)
                        
                        Text(String(instruction))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(.horizontal)
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
        .task {
            viewModel.getCocktailById(cocktailId)
        }
    }
}


