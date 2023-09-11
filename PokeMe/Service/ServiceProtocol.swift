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
    func getOperation(url: String, parameters: ServiceParameters?) async throws -> Any
    static func executeImageDownload(url: URL, completion: @escaping ServiceCompletion)
}
