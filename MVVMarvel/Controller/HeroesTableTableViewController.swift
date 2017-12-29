//
//  HeroesTableTableViewController.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 24/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HeroesTableTableViewController: UITableViewController, UISearchBarDelegate {

    var viewModel = [HeroViewModel]()
    var viewModelFomRx = [HeroViewModel]()
    let disposeBag = DisposeBag()
    private var dataSource :TableViewDataSource<SourceTableViewCell,HeroViewModel>!
    lazy var searchBar:UISearchBar = UISearchBar()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        Service().makeGetCall { (heroViewModel) in
            self.viewModel = heroViewModel!
            DispatchQueue.main.async {
                self.updateDataSource(withViewModel: self.viewModel)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpView()
        setUpSearchBar()
        setUpBindings()
    }

    private func setUpBindings() {
    
        searchBar.rx.text
        .orEmpty
        .subscribe(onNext: { [unowned self] query in 
            
            self.viewModelFomRx = self.viewModel.filter{ ($0.heroName?.hasPrefix(query))!}
            
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    private func setUpTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        title = Titles.tableViewTitle
    }
    
   private func setUpSearchBar() {
        searchBar.placeholder = Titles.searchBarPlaceholder
        navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
    private func setUpView() {
        self.searchBar.becomeFirstResponder()
    }
    
    private func updateDataSource(withViewModel viewModel: [HeroViewModel]) {
    
    dataSource = TableViewDataSource(cellIdentifier: Cells.cell, heroes: viewModel, configureCell: { (cell, hero) in
        cell.heroNameLabel.text = hero.heroName!
        cell.heroImage.image(fromUrl: hero.heroPhoto!)
    })

        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        switch searchText.isEmpty {
            
        case true:
            updateDataSource(withViewModel: viewModel)
        case false:
            updateDataSource(withViewModel: viewModelFomRx)
        }
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
}
