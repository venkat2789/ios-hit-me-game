//
//  BackgroundView.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/10/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Gameplay
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor")
        )
    }
}

struct TopView: View {
    @Binding var game: Gameplay
    
    var body: some View {
        HStack{
            ShapeCircleStroked(systemName: "arrow.counterclockwise")
            Spacer()
            ShapeCircleFilled(systemName: "list.dash")
        }
    }
}

struct InfoView: View {
    @Binding var game: Gameplay
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5){
            BottomLabelText(text: title)
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

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Gameplay()))
    }
}
