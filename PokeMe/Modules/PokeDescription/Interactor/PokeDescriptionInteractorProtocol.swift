//
//  PokeDescriptionInteractorProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

protocol PokeDescriptionInteractorProtocol {
    var presenter: PokeDescriptionPresenterProtocol? { get set }
    
    func fetchPokeDescription(from url: String)
//    func fetchImage(from url: URL) async throws -> UIImage
}
