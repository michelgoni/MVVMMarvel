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
    
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
        ) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        let initialFrame = originFrame
        let finalFrame = toView.frame
        
        toView.transform = CGAffineTransform(
            scaleX: initialFrame.width / finalFrame.width,
            y: initialFrame.height / finalFrame.height
        )
        toView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
        containerView.addSubview(toView)
        
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.0,
            animations: {
                toView.transform = .identity
                toView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        },
            completion: {_ in
                
                transitionContext.completeTransition(true)
        }
        )
    }
}
