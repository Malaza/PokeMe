//
//  Service.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/09.
//

import UIKit
import Alamofire

class Service: ServiceProtocol {
    
    func getOperation(from url: String) async throws -> Any {
        
        return try await withCheckedThrowingContinuation { continuation in
            Session.default.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response { response in
                    
                    switch response.result {
                    case .success(let data):
                        guard let result = data else {
                            fatalError("Expected non-nil result in the non-error case")
                        }
                        continuation.resume(returning: result)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    func downloadImageData(from url: URL) async throws -> Data {
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
    
}
