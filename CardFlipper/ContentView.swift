//
//  ContentView.swift
//  CardFlipper
//
//  Created by George on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗","🚚","🚜","🚛","🚔"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content : emojis[index])
                
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
            if isFaceUp {
                base.strokeBorder(lineWidth : 2)
                Text(content).font(.largeTitle)
            }
            else{
                base
            }
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
