//
//  CocktailDetailViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 02/01/2024.
//

import Foundation

@MainActor final class CocktailDetailViewModel: ObservableObject{
    @Published var cocktail: Cocktail?
    @Published var alertItem: AlertItem?
    
    func getCocktailById(_ id: Int){
        Task{
            do{
                cocktail = try await NetworkManager.shared.getCocktailById(id: id).mapToCocktails().first
            }catch{
                if let cocktailError = error as? CocktailError{
                    switch cocktailError{
                    case .invalidURL:
                        alertItem = AlertContext.invalidUrl
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
}