//
//  ViewController.swift
//  NavigationTransition
//
//  Created by 何常凱 on 2021/10/5.
//

import UIKit

class ViewController: UIViewController {
    
    var panInteraction: PanInteraction?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            panInteraction = PanInteraction(detailVC: detailVC)
        }
    }


}

extension ViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return PushAnimator()
        case .pop:
            return PopAnimator()
        default:
            return nil
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let panInteraction = panInteraction,
              panInteraction.isInteractive else  {return nil}
        return panInteraction
    }
}
