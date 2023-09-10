//
//  PokeDescriptionRouter.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeDescriptionRouter: PokeDescriptionRouterProtocol {

    var presenter: PokeDescriptionPresenterProtocol?

    static func setupModule() -> PokeDescriptionViewController {
        let vc = PokeDescriptionViewController()
        let interactor = PokeDescriptionInteractor()
        let router = PokeDescriptionRouter()
        let presenter = PokeDescriptionPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}
