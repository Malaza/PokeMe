//
//  PokeDescriptionViewController.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeDescriptionViewProtocol {
    
}

class PokeDescriptionViewController: UIViewController, PokeDescriptionViewProtocol {

    var presenter: PokeDescriptionPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
