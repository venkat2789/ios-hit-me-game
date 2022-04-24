//
//  HowToView.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/23/22.
//

import SwiftUI

struct HowToView: View {
    @Binding var howToDisplayed: Bool
    
    var body: some View {
        
        VStack(spacing: 10) {
            InstructionText(text: "How to play?")
            HowToBodyText(text: "🎯 A random number between 1 to 100 is given as target.\n\n 🎯 The goal is to slide the slider to the target.\n")
            Button(action: {
                withAnimation(){
                    howToDisplayed = false
                }
            }) {
                AlertButtonText(text: "Let's Go!")
            }
            .padding(.leading, 35)
            .padding(.trailing, 35)
            
        }
        .frame(maxWidth: 250)
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.Generic.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct HowToView_Previews: PreviewProvider {

    static var previews: some View {
        HowToView(howToDisplayed: Binding.constant(true))
        HowToView(howToDisplayed: Binding.constant(true))
            .previewLayout(.fixed(width: 568, height: 320))
        HowToView(howToDisplayed: Binding.constant(true))
            .preferredColorScheme(.dark)
        HowToView(howToDisplayed: Binding.constant(true))
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
