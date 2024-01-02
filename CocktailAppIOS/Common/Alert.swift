//
//  Alert.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 30/12/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidUrl = AlertItem(title: Text("Server error"), message: Text("An error occured because of an invalid url."), dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Server error"), message: Text("An error occured because of invalid data"), dismissButton: .default(Text("OK")))
}

