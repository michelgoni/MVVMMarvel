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
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        Service().makeGetCall { (heroViewModel) in
            self.viewModel = heroViewModel!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath)

        cell.textLabel?.text = viewModel[indexPath.row].heroName
        return cell
    }
    



}
