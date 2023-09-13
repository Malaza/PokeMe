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
    func getOperation() async throws -> Any
    static func executeImageDownload(url: URL, completion: @escaping ServiceCompletion)
}
