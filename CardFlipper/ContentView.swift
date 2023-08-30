//
//  ContentView.swift
//  CardFlipper
//
//  Created by George on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗","🚚","🚜","🚛","🚔", "✈️", "🚀", "🚁", "🚤"]
    @State var cardCount = 4
    
    var body: some View {
        VStack{
            cards
            cardControls        }
    }
    
    //COMPONENTS
    
    func cardControl(action : String) -> some View {
        if action == "REMOVE"{
            return Button(action: {
                    if cardCount > 2{
                        cardCount -= 1}
                }
            , label:  {
                Image(systemName: "minus.circle").imageScale(.large).font(.largeTitle)
            })
            
        }
        else {
            return Button(action: {
                
                    if cardCount < emojis.count{
                        cardCount += 1
                        
                    }
                
            }, label:  {
                Image(systemName: "plus.circle").imageScale(.large).font(.largeTitle)
            })
        }
    }
    
    var cards : some View {
        HStack{
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content : emojis[index])
                
            }
            
        }
    }
    var cardRemover : some View {
        cardControl(action: "REMOVE")
            }
    
    var cardAdder : some View {
        cardControl(action: "ADD")
    }
    var cardControls : some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
            
        }.padding()
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
