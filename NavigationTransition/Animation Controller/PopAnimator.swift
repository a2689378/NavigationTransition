//
//  PopAnimator.swift
//  NavigationTransition
//
//  Created by 何常凱 on 2021/10/10.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
        let fromView = transitionContext.view(forKey: .from),
        let toVC = transitionContext.viewController(forKey: .to),
        let toView = transitionContext.view(forKey: .to) else {return}
        
        let containerView = transitionContext.containerView
        
//        containerView.addSubview(toView)
        containerView.insertSubview(toView, belowSubview: fromView)
        
        fromView.layer.shadowOpacity = 0.5
        fromView.layer.shadowRadius = 10
        fromView.layer.shadowPath = UIBezierPath(rect: fromView.bounds).cgPath
        
        toView.alpha = 1
        toView.transform = CGAffineTransform(translationX: -containerView.frame.width / 3, y: 0)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext)) {
            fromView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)
            
            toView.transform = .identity
        } completion: { _ in
            fromView.transform = .identity
            toView.transform = .identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

    }
    
}
