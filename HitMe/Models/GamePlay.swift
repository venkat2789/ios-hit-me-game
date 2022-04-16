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
        let score = 100 - difference //100 points for an exact guess
        var bonus = 0
        
        if(difference == 0){
            bonus = 100
        } else if (difference <= 2){
            bonus = 50
        }
        
        return score + bonus
    }
    
    mutating func startNewRound(points: Int){
        self.round += 1
        self.score += points
        target = Int.random(in: 1...100)
    }
    
    mutating func restartGame(){
        self.round = 1
        self.score = 0
        target = Int.random(in: 1...100)
    }
}
