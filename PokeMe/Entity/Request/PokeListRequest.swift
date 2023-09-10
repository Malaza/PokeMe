//
//  PokeListRequest.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/10.
//

import UIKit

struct PokeListRequest {
    var url: String!
    var limit: Int?
    
    func convertToServiceParameters() -> ServiceParameters {
        var payload:Dictionary = [String: Any]()
        payload["limit"] = self.limit as AnyObject
        return payload as ServiceParameters
    }
}
