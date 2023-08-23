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
            CardView()
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
    var isFaceUp : Bool = false
    var body: some View {
        ZStack{
            if isFaceUp {
                Circle().strokeBorder(lineWidth: 2)
                Circle().foregroundColor(.white)
                Text("✈️").font(.largeTitle)
            }
            else{
                Circle()
            }
            
        }
    }
}
