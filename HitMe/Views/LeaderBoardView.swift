//
//  LeaderBoardView.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/17/22.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardDisplayed: Bool
    @Binding var game: Gameplay
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView(leaderboardDisplayed: $leaderboardDisplayed)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderBoardEntries.indices, id: \.self) { i in
                            let leaderBoardEntry = game.leaderBoardEntries[i]
                            RowView(index: i + 1, score: leaderBoardEntry.score, date: leaderBoardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack{
            ShapeCircleStrokedWithText(text: String(index))
            Spacer()
            LeaderBoardScoreText(score: score)
                .frame(width: Constants.LeaderBoard.scoreColWidth)
            Spacer()
            LeaderBoardDateText(date: date)
                .frame(width: Constants.LeaderBoard.dateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.Generic.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderboardDisplayed: Bool
    
    var body: some View{
        ZStack {
            LeaderBoardTitleText(text: "Top Scores")
            HStack{
                Spacer()
                Button(action: {
                    leaderboardDisplayed = false
                }) {
                    ShapeCircleFilled(systemName: "xmark")
                        .padding(.trailing, 10.0)
                        .padding(.top, 10.0)
                }

            }
        }
    }
    
}

struct LabelView: View {
    
    var body: some View{
        
        HStack{
            Spacer()
                .frame(width: Constants.Generic.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.LeaderBoard.scoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.LeaderBoard.dateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
        
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardDisplayed = Binding.constant(false)
    static private var game = Binding.constant(Gameplay(loadTestData: true))
    
    static var previews: some View {
        LeaderBoardView(leaderboardDisplayed: leaderboardDisplayed, game: game)
        LeaderBoardView(leaderboardDisplayed: leaderboardDisplayed, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderboardDisplayed: leaderboardDisplayed, game: game)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderboardDisplayed: leaderboardDisplayed, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
