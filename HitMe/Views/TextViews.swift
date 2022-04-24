//
//  TextViews.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/10/22.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
    
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 40.0)
    }
    
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(1.5)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
    }
    
}

struct AlertBodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(10)
    }
    
}

struct HowToBodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(0.2)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(2)
    }
    
}

struct AlertButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.white)
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color("AccentColor"))
            .cornerRadius(12.0)
    }
    
}

struct LeaderBoardScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))

    }
    
}

struct LeaderBoardDateText: View {
    var date: Date
    
    var body: some View {
        Text(date.formatted(.dateTime.day().month().hour().minute()))
            .kerning(-0.2)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))

    }
    
}

struct LeaderBoardTitleText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
    
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "55")
            SliderLabelText(text: "45")
            LabelText(text: "Score")
            AlertBodyText(text: "You scored this many points\n in this round")
            AlertButtonText(text: "Start New Round")
            LeaderBoardScoreText(score: 10)
            LeaderBoardDateText(date: Date())
            LeaderBoardTitleText(text: "Leaderboard")
            HowToBodyText(text: "You are given a target")
        }
        .padding()
    }
}
