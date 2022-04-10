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

}
