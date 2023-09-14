//
//  ImageCache.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/13.
//

import UIKit

class ImageCache {
    
    private var cache: [URL: UIImage] = [:]

    func cacheImage(_ image: UIImage, for url: URL) {
        cache[url] = image
    }

    func image(for url: URL) -> UIImage? {
        return cache[url]
    }
}
