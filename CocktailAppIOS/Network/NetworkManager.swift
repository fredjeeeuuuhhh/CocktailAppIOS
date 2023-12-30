//
//  NetworkManager.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 30/12/2023.
//

import Foundation
import UIKit

final class NetworkManager{
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    static let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    private init(){}
    
    func getAllCocktailsByFirstLetter(firstLetter: String) async throws -> [Cocktail] {
        guard let url = URL(string: "\(NetworkManager.baseURL)/search.php?f=\(firstLetter)") else {
            throw CocktailError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
       
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(CocktailGetAllResponse.self, from: data).drinks
        }catch {
            throw CocktailError.invalidData
        }
    }
}
