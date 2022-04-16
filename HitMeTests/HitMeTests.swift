//
//  HitMeTests.swift
//  HitMeTests
//
//  Created by Venkatachalapathy Sivaprakasam on 4/9/22.
//

import XCTest
@testable import HitMe

class HitMeTests: XCTestCase {
    var game: Gameplay!

    override func setUpWithError() throws {
        game = Gameplay()
    }

    override func tearDownWithError() throws {
        game = nil
    }
    
    func testCalcPointsPositive() throws {
        let guess = game.target + 5
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
        
    }
    
    func testCalcPointsNegative() throws {
        let guess = game.target - 5
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
        
    }
    
    func testNewRound() throws {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact() throws {
        let guess = game.target
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 100 + 100)//bonus of 100 points for exact guess
    }
    
    func testScoreAlmostExact() throws {
        let guess = game.target - 2
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 99 + 50)//bonus of 50 points for close guess
    }
    
    func testRestart() throws {
        game.restartGame()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }

}
