//
//  PushAnimator.swift
//  NavigationTransition
//
//  Created by 何常凱 on 2021/10/5.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
        let fromView = transitionContext.view(forKey: .from),
        let toVC = transitionContext.viewController(forKey: .to),
        let toView = transitionContext.view(forKey: .to) else {return}
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toView)
        
        toView.alpha = 0
        toView.transform = CGAffineTransform(translationX: containerView.frame.width, y: 0)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext)) {
            fromView.alpha = 0
            fromView.transform = CGAffineTransform(translationX: -containerView.frame.width, y: 0)

            
            toView.alpha = 1
            toView.transform = .identity
        } completion: { _ in
            fromView.transform = .identity
            toView.transform = .identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }

    }
    

}
