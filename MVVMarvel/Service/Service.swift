//
//  Service.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 24/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import Foundation

class Service {
    
enum MyError: Error {
        case FoundNil(String)
}
typealias HeroAlias = (([HeroViewModel]?) -> Void)
    func makeGetCall(completion: @escaping HeroAlias){
     
        var arrayHeroModel = [HeroViewModel] ()
       
        let todoEndpoint: String = "https://api.myjson.com/bins/bvyob"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URLRequest(url: url)) {
            (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let heroesIndex = try? JSONDecoder().decode(HeroesIndex.self, from: responseData) else {
                    throw MyError.FoundNil("Somethin´happened decoding")
                }
                heroesIndex.superheroes!.forEach{
                    arrayHeroModel.append(HeroViewModel(hero: $0))
                }
                completion(arrayHeroModel)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        
        task.resume()
    }
}
