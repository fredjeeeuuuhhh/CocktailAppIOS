//
//  RemoteImage.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 04/01/2024.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject{
    @Published var image: Image? = nil
    
    func loadImage(urlString: String){
        Task{
            guard let uiImage = try await NetworkManager.shared.downloadImage(urlString: urlString) else{
                return
            }
            self.image = Image(uiImage: uiImage)
        }
    }
    
}

struct RemoteImage: View{
    var image: Image?
    var body: some View{
        image?.resizable() ?? Image("preview")
    }
}

struct CocktailOrIngredientRemoteImage: View{
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .task {
                imageLoader.loadImage(urlString: urlString)
            }
    }
}
