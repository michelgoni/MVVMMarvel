//
//  Result.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 17/1/18.
//  Copyright © 2018 Miguel Goñi. All rights reserved.
//

import Foundation

enum Result<T,U> where U: Error {
    
    case success(T)
    case failure(U)
}
