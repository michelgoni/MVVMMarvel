//
//  Animator.swift
//  MVVMarvel
//
//  Created by Miguel Goñi on 29/12/17.
//  Copyright © 2017 Miguel Goñi. All rights reserved.
//

import UIKit
class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 1.0
    var originFrame = CGRect.zero
    var presenting = true
   
    
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
        ) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //1) Set up transition
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let hero = presenting ? toView : transitionContext.view(forKey: .from)!
        
        let initialFrame = presenting ? originFrame : hero.frame
        let finalFrame = presenting ? hero.frame : originFrame
        
        let xScaleFactor = presenting
            ? initialFrame.width / finalFrame.width
            : finalFrame.width / initialFrame.width
        
        let yScaleFactor = presenting
            ? initialFrame.height / finalFrame.height
            : finalFrame.height / initialFrame.height
        
        let scaleFactor = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        if presenting {
            hero.transform = scaleFactor
            hero.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
        }
        
        containerView.addSubview(toView)
        containerView.bringSubview(toFront: hero)
        
        let heroeDetailViewController = transitionContext.viewController(forKey: presenting ? .to : .from) as! HeroeDetailViewController
        if presenting {
            heroeDetailViewController.containerView.alpha = 0.0
        }

        
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.0,
            animations: {
                hero.transform = self.presenting ? .identity : scaleFactor
                hero.center = CGPoint(x: finalFrame.midX,y: finalFrame.midY)
                heroeDetailViewController.containerView.alpha = self.presenting ? 1.0 : 0.0
        },
            completion: {_ in
               
                if !self.presenting {
                    let navigationVC = transitionContext.viewController(forKey: .to) as! UINavigationController
                    
                    if  let tableVC = navigationVC.viewControllers[0] as? HeroesTableTableViewController {
                        tableVC.selectedImage?.isHidden = false
                    }
                    
                }
                transitionContext.completeTransition(true)
        }
        )
    }
}
