//
//  HeroTableViewCell.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 26/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import UIKit

class SourceTableViewCell : UITableViewCell {
    
    @IBOutlet weak var heroNameLabel :UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    
}

extension UITableView {
    
    func getSelectedImage( indexPath: IndexPath) -> UIImageView {
        

        let cell =  dequeueReusableCell(withIdentifier: Cells.cell, for: indexPath) as! SourceTableViewCell
        return cell.heroImage
    }
    
    func getSelectedImageFrame ( indexPath: IndexPath) -> CGRect {
        
        let rectOfCell = rectForRow(at: indexPath)
       
        return convert(rectOfCell, to: self.superview)
    }
    
    
}
