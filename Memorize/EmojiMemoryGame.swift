//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Bora Mert on 1.09.2023.
//  ViewModel

import SwiftUI



class EmojiMemoryGame {
    
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚅", "🚈",
                         "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🚝", "🚄", "🚂", "🧠"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex] }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
