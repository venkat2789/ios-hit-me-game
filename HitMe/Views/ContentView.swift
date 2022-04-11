//
//  ContentView.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertDisplayed = false
    @State private var sliderValue = 50.0
    @State private var game = Gameplay()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertDisplayed: $alertDisplayed, sliderValue: $sliderValue, game: $game)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
    
}

struct HitMeButton: View {
    @Binding var alertDisplayed: Bool
    @Binding var sliderValue: Double
    @Binding var game: Gameplay
    
    var body: some View {
        Button(action: {
            //            print("Button tapped")
            alertDisplayed = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(Color.white)
        .cornerRadius(21)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
        .strokeBorder(Color.white, lineWidth: 2.0))
        //alert below is specific to iOS 15
        .alert("Hello there!", isPresented: $alertDisplayed){
            Button("Awesome!") { }
        } message: {
            let roundedValue = Int(sliderValue.rounded())
            Text("The slider value is: \(roundedValue).\n" + "You scored \(game.calculatePoints(sliderValue: roundedValue)) points this round.")
        }
    }
}

struct InstructionView: View {
    @Binding var game: Gameplay
    
    var body: some View {
        InstructionText(text: "Pull the slider as close as you can to")
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
        BigNumberText(text: String(game.target))
    }
    
}
