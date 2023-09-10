//
//  ServiceProtocol.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Alamofire

typealias ServiceCompletion = (Any?, AFError?) -> Void
typealias ServiceParameters = [String: Any]

protocol ServiceProtocol {
    func getOperation(url: String, parameters: ServiceParameters, completion: @escaping ServiceCompletion)
//    func postOperation(parameters: [String: Any], completion: @escaping ServiceCompletion)
}
