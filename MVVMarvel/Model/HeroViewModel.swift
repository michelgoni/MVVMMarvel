//
//  HeroViewModel.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 24/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import Foundation


class HeroViewModel {
    
    private var hero: Hero?
   
    var heroName: String? {
        return hero?.name
    }
    var heroPhoto: String? {
        return hero?.photo
    }
    var heroRealName: String? {
        return hero?.realName
    }
    var heroHeight: String? {
        return hero?.height
    }
    var heroPower: String? {
        return hero?.power
    }
    var heroAbilities: String? {
        return hero?.abilities
    }
    var heroGroups: String? {
        return hero?.groups
    }
    
    init(hero: Hero) {
        self.hero = hero
    }
}
