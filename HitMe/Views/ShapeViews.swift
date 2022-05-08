//
//  ShapeViews.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/10/22.
//

import SwiftUI

struct ShapeCircleStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.Generic.roundedViewLength, height: Constants.Generic.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("ShapeStrokeColor"), lineWidth: Constants.Generic.strokeWidth)
            )

    }
}

struct ShapeCircleFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ShapeTextColor"))
            .frame(width: Constants.Generic.roundedViewLength, height: Constants.Generic.roundedViewLength)
            .background(
                Circle()
                    .fill(
                            Color("ShapeFillColor")
                    )
            )
    }
}

struct ShapeRectangleStroked: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.Generic.roundRectViewWidth, height: Constants.Generic.roundRectViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.Generic.roundRectCornerRadius)
                    .strokeBorder(Color("ShapeStrokeColor"), lineWidth: Constants.Generic.strokeWidth)
            )

    }
}

struct ShapeCircleStrokedWithText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.Generic.roundedViewLength, height: Constants.Generic.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.Generic.strokeWidth)
            )

    }
}

struct ShapeCircleStrokedSmall: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.Generic.roundedViewLengthSmall, height: Constants.Generic.roundedViewLengthSmall)
            .overlay(
                Circle()
                    .strokeBorder(Color("ShapeStrokeColor"), lineWidth: Constants.Generic.strokeWidth)
            )

    }
}

struct ShapeCircleFilledSmall: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.caption)
            .foregroundColor(Color("ShapeTextColor"))
            .frame(width: Constants.Generic.roundedViewLengthSmall, height: Constants.Generic.roundedViewLengthSmall)
            .background(
                Circle()
                    .fill(
                            Color("ShapeFillColor")
                    )
            )
    }
}

struct PreviewView: View {
    var body: some View{
        VStack {
            HStack{
                ShapeCircleStroked(systemName: "arrow.counterclockwise")
                ShapeCircleFilled(systemName: "list.dash")
                ShapeRectangleStroked(text: "999")
                ShapeCircleStrokedWithText(text: "99")
            }
            HStack {
                ShapeCircleStrokedSmall(systemName: "arrow.counterclockwise")
                ShapeCircleFilledSmall(systemName: "list.dash")
            }
        }
    }
}

struct ShapeViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
