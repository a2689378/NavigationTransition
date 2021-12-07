//
//  PanInteraction.swift
//  NavigationTransition
//
//  Created by 何常凱 on 2021/10/10.
//

import UIKit

class PanInteraction: UIPercentDrivenInteractiveTransition {
    
    let detailVC: DetailViewController
    var isInteractive = false
    
    init(detailVC: DetailViewController) {
        self.detailVC = detailVC
        
        super.init()
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        detailVC.view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(pan: UIPanGestureRecognizer) {
        
        let progress = pan.translation(in: pan.view).x / 200
        
        switch pan.state {
        case .began:
            isInteractive = true
            detailVC.navigationController?.popViewController(animated: true)
        case .changed:
            update(progress)
        case .cancelled, .ended:
            isInteractive = false
            if progress > 0.5 {
                finish()
            } else {
                cancel()
            }
        default:
            break
        }
    }
}
