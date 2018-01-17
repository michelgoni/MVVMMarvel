//
//  HeroFeed.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 17/1/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

enum HeroFeedType {
    
    case wholeSuperHeroes
    case singleSuperHeroe //in case our server could accept a get method for a singe super hero
}

extension HeroFeedType: EndPoint {
    
    var base: String {
        return "https://api.myjson.com/"
    }
    
    var path: String {
        
        switch self {
            
        case .wholeSuperHeroes:
            return "bins/bvyob"
        case .singleSuperHeroe:
            return "bins/bvyob"
        }
    }
}
