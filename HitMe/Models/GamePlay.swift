//
//  GamePlay.swift
//  HitMe
//
//  Created by Venkatachalapathy Sivaprakasam on 4/9/22.
//

import Foundation

struct LeaderBoardEntry {
    let score: Int
    let date: Date
    
}

struct Gameplay {
    var target: Int = Int.random(in: 1...100)
    var score:Int = 0
    var round:Int = 1
    var leaderBoardEntries : [LeaderBoardEntry] = []
    
    init (loadTestData: Bool = false){
        if loadTestData {
            leaderBoardEntries.append(LeaderBoardEntry(score: 100, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 20, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 145, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 80, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 200, date: Date()))
        }
    }
    
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
    
    mutating func calculateFinalPoints(points: Int){
        self.score += points
        addToLeaderBoard(score: score, date: Date())
    }
    
    mutating func restartGame(){
        self.round = 1
        self.score = 0
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderBoard(score: Int, date: Date) {
        leaderBoardEntries.append(LeaderBoardEntry(score: score, date: date))
        leaderBoardEntries.sort { $0.score > $1.score }
    }
}


