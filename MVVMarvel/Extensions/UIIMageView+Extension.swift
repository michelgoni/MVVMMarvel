//
//  UIIMageView+Extension.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 28/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func image(fromUrl urlString: String) {
        guard let url = URL(string: urlString) else {
            print("\(urlString) could not be created")
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, _ in
            if let response = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: response)
                }
            }
        }
        task.resume()
    }
}
