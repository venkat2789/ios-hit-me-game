//
//  AlertView.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/16/22.
//

import SwiftUI

struct AlertView: View {
    @Binding var alertDisplayed: Bool
    @Binding var sliderValue: Double
    @Binding var game: Gameplay
    
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.calculatePoints(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "The slider value is")
            BigNumberText(text: String(roundedValue))
            AlertBodyText(text: "You scored \(points) points")
            Button(action: {
                withAnimation(){
                    alertDisplayed = false
                }
                game.startNewRound(points: points)
            }) {
                AlertButtonText(text: "Start New Round")
            }
            
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

struct AlertView_Previews: PreviewProvider {
    
    static private var alertDisplayed = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Gameplay())
    
    static var previews: some View {
        AlertView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
        AlertView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        AlertView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        AlertView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
