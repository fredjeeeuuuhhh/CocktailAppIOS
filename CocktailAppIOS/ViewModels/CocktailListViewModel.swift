//
//  CocktailViewModel.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 15/12/2023.
//

import SwiftUI
import Foundation

final class CocktailListViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []
    
    func getAllCocktailsByFirstLetter(firstLetter: String){
        Task{
            do{
                let cocktailResponse = try await NetworkManager.shared.getAllCocktailsByFirstLetter(firstLetter: firstLetter)
                cocktailResponse.forEach{ cocktail in
                    cocktails.append(cocktail)
                }
            } catch {
                if let cocktailError = error as? CocktailError{
                    switch cocktailError{
                    case .invalidURL:
                        print("Invalid URL")
                    case .invalidResponse:
                        print("Invalid Response")
                    case .invalidData:
                        print("Invalid Data")
                    case .unableToComplete:
                        print("Unable to complete")
                    }
                }
            }
        }
    }
}

