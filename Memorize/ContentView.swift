//
//  ContentView.swift
//  Memorize
//
//  Created by Bora Mert on 23.08.2023.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🚝", "🚄", "🚅", "🚈", "🚂", "🛰️"]
    @State var emojiCount = 12
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.horizontal)
            Spacer(minLength: 20)
            HStack{
                remove.font(.largeTitle)
                Spacer()
                VStack{
                    Text("Change")
                    Text("Cards")
                }.foregroundColor(.accentColor)
                .font(.body)
                Spacer()
                add.font(.largeTitle)
            }
            
            .padding(.horizontal)
        }
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var add: some View {
        Button(action: {
            if emojiCount < 19 {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4).foregroundColor(.red)
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
