//
//  UIViewController.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Lottie


private var animationView: LottieAnimationView?

extension UIViewController {
    
    //MARK: - Loading view
    func showLoadingView() {
        animationView = .init(name: "loading")
        animationView?.backgroundColor = .white
        animationView!.frame = self.view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.4
        self.view.addSubview(animationView!)
        animationView!.play()
    }
    
    func hideLoadingView() {
        animationView?.stop()
        animationView?.removeFromSuperview()
    }
    
    
    //MARK: - Error message
    func showErrorMessage(message:String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "PokeMe", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

