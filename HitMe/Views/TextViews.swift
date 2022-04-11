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

struct BottomLabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(1.5)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
    }
    
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "55")
            SliderLabelText(text: "45")
            BottomLabelText(text: "Score")
        }
    }
}
