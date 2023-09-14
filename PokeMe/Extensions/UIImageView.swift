//
//  UIImageView.swift
//  PokeMe
//
//  Created by Mthokozisi Malaza on 2023/09/14.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImage(url: String) {
        
        guard let url = URL(string: url) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        Service.downloadImageData(from: url, completion: { data, error in
            
            if let data = data as? Data {
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
                self.image = UIImage(data: data)
            }
            else {
                self.image = UIImage(named: "noImage")
            }
        })
    }
}
