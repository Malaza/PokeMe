//
//  PokeListRouter.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeListRouter: PokeListRouterProtocol {
    
    var presenter: PokeListPresenterProtocol?

    static func setupModule() -> PokeListViewController {
        let vc = PokeListViewController()
        let interactor = PokeListInteractor()
        let router = PokeListRouter()
        let presenter = PokeListPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
    
    func presentPokeDescriptionViewController(with url: String) {
        let viewController = PokeDescriptionRouter.setupModule(url: url)
        self.presenter?.view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
