//
//  PokeListViewController.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeListViewProtocol {
    func fetchPokeList()
}


class PokeListViewController: UIViewController {

    var presenter: PokeListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchPokeList()
    }
}


extension PokeListViewController: PokeListViewProtocol {
    
    func fetchPokeList() {
        self.presenter?.fetchPokeList()
    }
}
