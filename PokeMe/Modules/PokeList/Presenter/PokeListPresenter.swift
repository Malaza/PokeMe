//
//  PokeListPresenter.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeListPresenter: PokeListPresenterProtocol {

    var view: PokeListViewProtocol?
    var router: PokeListRouterProtocol?
    var interactor: PokeListInteractorProtocol?

    init(interactor: PokeListInteractorProtocol, router: PokeListRouterProtocol, view: PokeListViewProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchPokeList() {
        self.interactor?.fetchPokeList()
    }
}
