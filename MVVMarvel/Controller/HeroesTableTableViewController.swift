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
    let transition = Animator()
    var selectedImage: UIImageView?
    var selectedImageFrame : CGRect?
    var searchIsActive = true
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
        setUpSearchBar()
        setUpBindings()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
   
    private func updateDataSource(withViewModel viewModel: [HeroViewModel]) {
    
    dataSource = TableViewDataSource(cellIdentifier: Cells.cell, heroes: viewModel, configureCell: { (cell, hero) in
        cell.heroNameLabel.text = hero.heroName!
        cell.heroImage.image(fromUrl: hero.heroPhoto!)
    })

        reloadHeroesTableView()
    }
    
    //MARK:--UISearchbar delegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchBar.becomeFirstResponder()
        switch searchText.isEmpty {
        case true:
            updateDataSource(withViewModel: viewModel)
             self.searchBar.resignFirstResponder()
            
        case false:
            updateDataSource(withViewModel: viewModelFomRx)
            searchIsActive = false
            
        }
        reloadHeroesTableView()
       
    }
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.searchBar.endEditing(true)
        self.searchBar.resignFirstResponder()
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let heroeDetails = storyboard!.instantiateViewController(withIdentifier: StoryBoardsIdentifiers.heroeDetailsViewController) as! HeroeDetailViewController
        selectedImage = tableView.getSelectedImage(indexPath: indexPath)
        selectedImageFrame = tableView.getSelectedImageFrame(indexPath: indexPath)
        
        switch searchIsActive {
        case false:
            heroeDetails.hero = viewModelFomRx[indexPath.row]
            searchIsActive = true
        default:
            heroeDetails.hero = viewModel[indexPath.row]
        }
        
        heroeDetails.transitioningDelegate = self
        present(heroeDetails, animated: true, completion: nil)
    }
    
    private func reloadHeroesTableView() {
        self.tableView.dataSource = self.dataSource
        self.tableView.reloadData()
    }
}

extension HeroesTableTableViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.originFrame = selectedImageFrame!
        selectedImage!.isHidden = true
         transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
     
        selectedImage!.isHidden = false
         transition.presenting = false
        return transition
    }
}
