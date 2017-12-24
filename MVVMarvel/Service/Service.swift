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
    
    func makeGetCall() {
        // Set up the URL request
        let todoEndpoint: String = "https://api.myjson.com/bins/bvyob"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        
        // make the request
        let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URLRequest(url: url)) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            do {
                guard let myStructDictionary = try? JSONDecoder().decode(HeroesIndex.self, from: responseData) else {
                    throw MyError.FoundNil("Somethin´happened decoding")
                }
                print(myStructDictionary.superheroes!.first!.abilities!)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        
        task.resume()
    }
}
