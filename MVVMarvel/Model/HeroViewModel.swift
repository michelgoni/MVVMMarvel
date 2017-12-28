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
    var bindToSourceViewModel: (() -> ()) = {}
   
    var heroName: String? {
        guard let heroName = hero?.name else {return nil}
        return heroName
    }
    var heroPhoto: String? {
        guard let heroPhoto = hero?.photo else { return nil }
        return heroPhoto
    }
    var heroRealName: String? {
        guard let heroRealName = hero?.realName  else { return nil }
        return heroRealName
    }
    var heroHeight: String? {
        guard let heroHeight = hero?.height else { return nil }
        return heroHeight
    }
    var heroPower: String? {
        guard let heroPower = hero?.power else { return nil }
        return heroPower
    }
    var heroAbilities: String? {
        
        guard let heroAbilities = hero?.abilities else { return nil }
        return heroAbilities
    }
    var heroGroups: String? {
        guard let heroGroups = hero?.groups else { return nil }
        return heroGroups
    }
    
    init(hero: Hero) {
        self.hero = hero
    }
}
