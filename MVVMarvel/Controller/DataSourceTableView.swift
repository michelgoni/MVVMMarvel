//
//  DataSourceTableView.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 26/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import UIKit

class TableViewDataSource<Cell :UITableViewCell,T> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var cellIdentifier :String!
    private var heroes :[T]!
    var configureCell :(Cell,T) -> ()
    
    init(cellIdentifier :String, heroes :[T], configureCell: @escaping (Cell,T) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.heroes = heroes
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        self.configureCell(tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell,self.heroes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
   
}

