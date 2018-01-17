//
//  Endpoint.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 17/1/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

protocol EndPoint {
    
    var base: String {get}
}

extension EndPoint {
    
    var urlComponents: URLComponents {
        return URLComponents(string: base)!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponents.url!)
    }
}
