//
//  ContentView.swift
//  CardFlipper
//
//  Created by George on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let themes : [String : [String]] = [
        "vehicles" : ["🚗","🚚","🚜","🚛","🚔", "✈️", "🚀", "🚁", "🚤", "⛴️", "🛩️", "🛺", "🏎️", "🚙","🚓","🚌"],
        "animals" : ["🐶","🐷","🐸","🐒","🐔","🐣","🦆","🦅","🦉","🐝","🪱","🐛","🦋","🐌","🦁","🦀"],
        "sports" : ["⚽️","🏀","🏈","⚾️","🥎","🏐","🎱","🏓","🏑","🥊","🎽","🪃","🛼","⛸️","🤿","⛳️"]
    ]
    @State var cardCount = 16
    @State var currentTheme = "vehicles"
    
    var body: some View {
        VStack{
            if verticalSizeClass == .compact{
                Text("Memorize!").font(.system(size : 26))
                ScrollView{
                    cards.padding()
                }
                
            }
            else{
                Text("Memorize!").font(.largeTitle)
                ScrollView{
                    cards
                }


            }
            
                        themeControls.padding()
            
        }
    }
    
    //COMPONENTS


    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content : themes[currentTheme]![index])
            }
            
        }
    }

    
    var themeControls : some View {
        VStack{
            Text("Theme").font(.body)
            HStack{
                Button(action: {
                    currentTheme = "vehicles"
                }, label: {
                    VStack{
                        Image(systemName: "car.fill").imageScale(.large)
                        Text("Vehicles").font(Font.body)
                    }
                })
                Spacer()
                Button(action: {
                    currentTheme = "animals"
                }, label: {
                    VStack{
                        Image(systemName: "pawprint.fill").imageScale(.large)
                        Text("Animals").font(Font.body)
                    }                })
                Spacer()
                Button(action: {
                    currentTheme = "sports"
                }, label: {
                    VStack{
                        Image(systemName: "soccerball").imageScale(.large)
                        Text("Sports").font(Font.body)
                    }
                })
            }
        }
    }
    }
                   




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView : View{
    @State var isFaceUp = true
    var base = Circle()
    var content : String
    var body: some View {
        ZStack{
            Group{
                base.strokeBorder(lineWidth : 2)
                Text(content).font(.system(size : 44))
            }.opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
            
            
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
