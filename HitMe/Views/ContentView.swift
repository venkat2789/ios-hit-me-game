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
        VStack {
            Text("PULL THE SLIDER AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .fontWeight(.bold)
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .fontWeight(.bold)
            }
            Button(action: {
                print("Button tapped")
                alertDisplayed = true
            }) {
                Text("Hit me!")
            }
            //alert below is specific to iOS 15
            .alert("Hello there!", isPresented: $alertDisplayed){
                Button("Awesome!") { }
            } message: {
                let roundedValue = Int(sliderValue.rounded())
                Text("The slider value is: \(roundedValue).\n" + "You scored \(game.calculatePoints(sliderValue: roundedValue)) points this round.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
