//
//  PokeDescriptionPresenter.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeDescriptionPresenter: PokeDescriptionPresenterProtocol {
    
    var view: PokeDescriptionViewProtocol?
    var router: PokeDescriptionRouterProtocol?
    var interactor: PokeDescriptionInteractorProtocol?

    init(interactor: PokeDescriptionInteractorProtocol, router: PokeDescriptionRouterProtocol, view: PokeDescriptionViewProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchPokeDescription(request: PokeDescriptionRequest) async {
        await self.interactor?.fetchPokeDescription(request: request)
    }
    
    func interactorDidFetchPokeDescription(with result: Result<PokemonResponse, Error>) {
        
    }
}
