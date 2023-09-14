//
//  ServiceProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Alamofire

typealias ServiceCompletion = (Any?, AFError?) -> Void

protocol ServiceProtocol {
    func getOperation(from url: String, completion: @escaping ServiceCompletion)
    static func downloadImageData(from url: URL, completion: @escaping ServiceCompletion)
}
