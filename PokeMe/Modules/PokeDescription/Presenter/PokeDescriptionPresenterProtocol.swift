//
//  PokeDescriptionPresenterProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeDescriptionPresenterProtocol {
    var view: PokeDescriptionViewProtocol? { get set }
    var router: PokeDescriptionRouterProtocol? { get set }
    var interactor: PokeDescriptionInteractorProtocol? { get set }
}
