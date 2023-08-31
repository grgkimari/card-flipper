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
            ScrollView{
                cards
            }
            cardControls
            
        }
    }
    
    //COMPONENTS
    func incrementCardCount (){
        cardCount += 1
    }
    
    func decrementCardCount (){
        cardCount -= 1
    }
    
    func cardControl(action : String) -> some View {
        var iconName  = ""
        if action == "ADD" {
            iconName = "plus.circle"
        }
        else{
            iconName = "minus.circle"
        }
        return Button(action: {
            if action == "ADD"{
                incrementCardCount()
            }
            else{
                decrementCardCount()
            }
        }, label: {
            Image(systemName: iconName).imageScale(.large).font(.largeTitle)
        }).disabled({
            if action == "ADD" && cardCount == emojis.count{
                return true
            }
            else if(action == "REMOVE" && cardCount == 3){
                return true
            }
            else{
                return false
            }
        }())
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content : emojis[index]).aspectRatio(2/3, contentMode: .fit)
                
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
