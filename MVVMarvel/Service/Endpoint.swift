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
    var path: String { get }
}

extension EndPoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponents.url!)
    }
}
