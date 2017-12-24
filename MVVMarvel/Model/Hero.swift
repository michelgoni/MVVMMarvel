//
//  Model.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 24/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import Foundation

struct HeroesIndex: Codable {
    
    let superheroes: [Hero]?
}

class Hero: Codable {
    
    var name: String?
    var photo: String?
    var realName: String?
    var height: String?
    var power: String?
    var abilities: String?
    var groups: String?
    
    
    init(name: String, photo: String, realName: String, height: String, power: String, abilities: String, groups: String) {
        self.name = name
        self.photo = photo
        self.realName = realName
        self.height = height
        self.power = power
        self.abilities = abilities
        self.groups = groups
    }
}
