//
//  HeroeDetailViewController.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 29/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import UIKit

class HeroeDetailViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var containerView: UIView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
    }
    
    @objc func actionClose(_ tap: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
