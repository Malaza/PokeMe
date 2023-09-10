//
//  PokeListRequest.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

class PokeListRequest {
    var url: String?
    var limit: Int?
    
    func convertToDictionary() -> AnyObject {
        var payload:Dictionary = [String: AnyObject]()
        payload["limit"] = self.limit as AnyObject
        return payload as AnyObject
    }
}
