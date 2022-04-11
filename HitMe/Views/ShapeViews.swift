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
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ShapeStrokeColor"), lineWidth: 2.0)
            )

    }
}

struct ShapeCircleFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ShapeTextColor"))
            .frame(width: 56.0, height: 56.0)
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
            .frame(width: 68.0, height: 56.0)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("ShapeStrokeColor"), lineWidth: 2.0)
            )

    }
}

struct PreviewView: View {
    var body: some View{
        HStack{
            ShapeCircleStroked(systemName: "arrow.counterclockwise")
            ShapeCircleFilled(systemName: "list.dash")
            ShapeRectangleStroked(text: "999")
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
