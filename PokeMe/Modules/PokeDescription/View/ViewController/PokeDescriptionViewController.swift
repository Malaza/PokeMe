//
//  PokeDescriptionViewController.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeDescriptionViewProtocol {
    func showData()
}

class PokeDescriptionViewController: UIViewController {
    
    @IBOutlet weak var pokemonDescriptionView: PokemonDescriptionView!
    
    
    var presenter: PokeDescriptionPresenterProtocol?
    var url: String?

    
    convenience init(url: String?) {
        self.init()
        self.url = url
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PokeMe"
        self.fetchPokeDescription(url: self.url ?? "")
    }
    
    
    func fetchPokeDescription(url: String) {
        self.showLoadingView()
        self.presenter?.fetchPokeDescription(from: url)
    }
}


extension PokeDescriptionViewController: PokeDescriptionViewProtocol {
    
    func showData() {
        DispatchQueue.main.async {
            if let model = self.presenter?.pokemonObject() {
                self.pokemonDescriptionView.configureDescriptionView(model: model)
            }
            self.hideLoadingView()
        }
    }
}

