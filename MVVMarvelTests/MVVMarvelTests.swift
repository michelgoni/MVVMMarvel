//
//  MVVMarvelTests.swift
//  MVVMarvelTests
//
//  Created by Miguel Goñi on 24/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import XCTest
@testable import MVVMarvel

class MVVMarvelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHeroViewModelHasHero() {
    
        let hero = Hero(name: "Spiderman", photo: "https://i.annihil.us/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg", realName: "Peter Benjamin Parker", height: "1,79", power: "Peter can cling to most surfaces, has superhuman strength (able to lift 10 tons optimally) and is roughly 15 times more agile than a regular human.", abilities: "Peter is an accomplished scientist, inventor and photographer.", groups: "Avengers, formerly the Secret Defenders, New Fantastic Four, the Outlaws")
        let heroViewModel = HeroViewModel(hero: hero)
        XCTAssertEqual(heroViewModel.heroName, "Spiderman")
        XCTAssertEqual(heroViewModel.heroPhoto, "https://i.annihil.us/u/prod/marvel/i/mg/9/30/538cd33e15ab7/standard_xlarge.jpg")
        XCTAssertEqual(heroViewModel.heroRealName, "Peter Benjamin Parker")
        XCTAssertEqual(heroViewModel.heroHeight, "1,79")
        XCTAssertEqual(heroViewModel.heroPower, "Peter can cling to most surfaces, has superhuman strength (able to lift 10 tons optimally) and is roughly 15 times more agile than a regular human.")
        XCTAssertEqual(heroViewModel.heroAbilities, "Peter is an accomplished scientist, inventor and photographer.")
        XCTAssertEqual(heroViewModel.heroGroups, "Avengers, formerly the Secret Defenders, New Fantastic Four, the Outlaws")
        
    }
    
}
