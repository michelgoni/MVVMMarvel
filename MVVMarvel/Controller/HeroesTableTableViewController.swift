//
//  HeroesTableTableViewController.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 24/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import UIKit

class HeroesTableTableViewController: UITableViewController {

    var viewModel = [HeroViewModel]()
    private var dataSource :TableViewDataSource<SourceTableViewCell,HeroViewModel>!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        Service().makeGetCall { (heroViewModel) in
            self.viewModel = heroViewModel!
            DispatchQueue.main.async {
                self.updateDataSource()
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func updateDataSource() {
     
        dataSource = TableViewDataSource(cellIdentifier: "heroCell", heroes: viewModel, configureCell: { (cell, hero) in
            cell.heroNameLabel.text = hero.heroName!
            cell.heroDescriptionLabel.text = hero.heroAbilities!
        })
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }

 

    
  
    



}
