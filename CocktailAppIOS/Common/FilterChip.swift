//
//  FilterChip.swift
//  CocktailAppIOS
//
//  Created by Frederic de Tender on 04/01/2024.
//

import SwiftUI

struct FilterChip: View {
    let character: String
    @Binding var selectedCharacter: String
    var body: some View {
        Text(character)
                .frame(width: 50, height: 25)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 2)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(selectedCharacter == character ? Color.accentColor : Color.clear)
                        )
                )
                .padding(2)
    }
}


