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
        animationView = .init(name: "pokemon")
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
    
    
    //MARK: - Navigation bar
    func setUpNavigationBar(title: String?, backButton:Bool) {
        
        self.navigationItem.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.isNavigationBarHidden = false
        
        if backButton {
            let backImage = UIImage(systemName: "arrow.left")
            let leftBackButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(self.popViewControllerAnimated))
            leftBackButton.imageInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
            self.navigationItem.leftBarButtonItem = leftBackButton
            self.navigationController?.navigationBar.tintColor = .black
        }
        else {
            let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
            navigationItem.leftBarButtonItem = backButton
            self.navigationController?.navigationBar.tintColor = .black
        }
    }
    
    @objc func popViewControllerAnimated() {
        self.navigationController?.popViewController(animated: true)
    }
}

