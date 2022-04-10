//
//  GamePlay.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/9/22.
//

import Foundation

struct Gameplay {
    var target: Int = Int.random(in: 1...100)
    var score:Int = 0
    var round:Int = 1
    
    func calculatePoints(sliderValue: Int) -> Int{
        let difference = abs(sliderValue - target)
        return 100 - difference //100 points for an exact guess
    }
}
