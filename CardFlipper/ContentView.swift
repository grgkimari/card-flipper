//
//  ContentView.swift
//  CardFlipper
//
//  Created by George on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView : View{
    @State var isFaceUp = false
    var base = Circle()
    var body: some View {
        ZStack{
            if isFaceUp {
                base.strokeBorder(lineWidth : 2)
                Text("✈️").font(.largeTitle)
            }
            else{
                base
            }
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
