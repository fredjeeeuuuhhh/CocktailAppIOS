//
//  CocktailViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 15/12/2023.
//

import SwiftUI
import Foundation

@MainActor final class CocktailListViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedCocktail: Cocktail?
    @Published var selectedCharacter: String = "a"
    
    func getAllCocktailsByFirstLetter(firstLetter: String){
        isLoading = true
        Task{
            do{
                cocktails = try await NetworkManager.shared.getAllCocktailsByFirstLetter(firstLetter: firstLetter).mapToCocktails()
                isLoading = false
            } catch {
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
