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
    private let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    private init(){}
    
    func getAllCocktailsByFirstLetter(firstLetter: String) async throws -> [ApiCocktail] {
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
    
    func getCocktailById(id: Int) async throws -> [ApiCocktail] {
        guard let url = URL(string: "\(NetworkManager.baseURL)/lookup.php?i=\(id)") else {
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
    
    func getAllIngredients() async throws -> [ApiIngredientName] {
        guard let url = URL(string: "\(NetworkManager.baseURL)/list.php?i=list") else {
            throw CocktailError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
       
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(IngredientListResponse.self, from: data).drinks
        }catch {
            throw CocktailError.invalidData
        }
    }
    
    func getIngredientByName(name: String) async throws -> ApiIngredient {
        guard let url = URL(string: "\(NetworkManager.baseURL)/search.php?i=\(name)") else {
            throw CocktailError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(IngredientResponse.self, from: data).ingredients.first!
        }catch {
            throw CocktailError.invalidData
        }
    }
    
    func getCocktailsByIngredientName(name: String) async throws -> [ApiCocktail] {
        guard let url = URL(string: "\(NetworkManager.baseURL)/filter.php?i=\(name)") else {
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
    
    func downloadImage(urlString: String) async throws-> UIImage? {
        let key = NSString(string: urlString)
        
        if let image = cache.object(forKey: key) {
            return image
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else {
            return nil
        }
        
        self.cache.setObject(image, forKey: key)
        
        return image
    }
}
