//
//  GameOverView.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 5/1/22.
//

import SwiftUI

struct EndOfGameView: View {
    @Binding var alertDisplayed: Bool
    @Binding var sliderValue: Double
    @Binding var game: Gameplay
    
    
    var body: some View {
        let finalPoints = game.score //+ points
        
        VStack(spacing: 10) {
                InstructionText(text: "Game Over! Your final score is")
                BigNumberText(text: String(finalPoints))
                    HStack{
                        AlertBodyText(text: "Restart game")
                        ShapeCircleStrokedSmall(systemName: "arrow.counterclockwise")
                    }
                    HStack{
                        AlertBodyText(text: "or view top scores")
                        ShapeCircleFilledSmall(systemName: "list.dash")
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

struct GameOverView_Previews: PreviewProvider {
    static private var alertDisplayed = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Gameplay())
    
    static var previews: some View {
        EndOfGameView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
        EndOfGameView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        EndOfGameView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        EndOfGameView(alertDisplayed: alertDisplayed, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
