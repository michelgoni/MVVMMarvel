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
    lazy var searchBar:UISearchBar = UISearchBar()
    
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
        setUpTableView()
        setUpView()
        setUpSearchBar()
    }

    private func setUpTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        title = "Super Heroes"
    }
    
   private func setUpSearchBar() {
        searchBar.placeholder = "Search some Superhero"
        navigationItem.titleView = searchBar
    }
    private func setUpView() {
        self.searchBar.becomeFirstResponder()
    }
    
  private func updateDataSource() {
     
        dataSource = TableViewDataSource(cellIdentifier: "heroCell", heroes: viewModel, configureCell: { (cell, hero) in
            cell.heroNameLabel.text = hero.heroName!
            cell.heroImage.image(fromUrl: hero.heroPhoto!)
        })
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
}
