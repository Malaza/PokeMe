//
//  PokeListInteractorProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeListInteractorProtocol {
    var presenter: PokeListPresenterProtocol? { get set }
    
    func fetchPokeList(request: PokeListRequest) async
}
