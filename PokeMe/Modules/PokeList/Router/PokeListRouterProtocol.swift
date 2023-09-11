//
//  PokeListRouterProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeListRouterProtocol {
    
    var presenter: PokeListPresenterProtocol? { get set }
    
    func presentPokeDescriptionViewController(with url: String)
}
