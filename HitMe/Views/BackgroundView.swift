//
//  BackgroundView.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/10/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Gameplay
    @Binding var alertDisplayed: Bool
    @Binding var endOfGameAlertDisplayed : Bool
    @Binding var sliderValue: Double
    
    var body: some View {
        VStack{
            TopView(game: $game, alertDisplayed: $alertDisplayed, endOfGameAlertDisplayed: $endOfGameAlertDisplayed, sliderValue: $sliderValue)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Gameplay
    @Binding var alertDisplayed: Bool
    @Binding var endOfGameAlertDisplayed : Bool
    @Binding var sliderValue: Double
    @State var leaderboardDisplayed = false
    
    var body: some View {
        HStack{
            Button(action: {
                alertDisplayed = false
                endOfGameAlertDisplayed = false
                game.restartGame()
                sliderValue = 50.5
            }) {
                ShapeCircleStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leaderboardDisplayed = true
            }) {
                ShapeCircleFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardDisplayed, onDismiss: {}, content: { LeaderBoardView(leaderboardDisplayed: $leaderboardDisplayed, game: $game) })
        }
    }
}

struct InfoView: View {
    @Binding var game: Gameplay
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5){
            LabelText(text: title)
            ShapeRectangleStroked(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Gameplay
    var body: some View {
        HStack{
            InfoView(game: $game, title: "Score", text: String(game.score))
            Spacer()
            InfoView(game: $game, title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacityMultiplier  = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color ("RingsColor").opacity(opacityMultiplier * 0.8), Color ("RingsColor").opacity(0.0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
    
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Gameplay()), alertDisplayed: Binding.constant(false), endOfGameAlertDisplayed: Binding.constant(false), sliderValue: Binding.constant(50.5))
    }
}
