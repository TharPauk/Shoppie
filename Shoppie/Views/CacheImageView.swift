//
//  CacheImageView.swift
//  Shoppie
//
//  Created by Min Thet Maung on 02/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CacheImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrl(string urlString: String) {
        
        self.imageUrlString = urlString
        guard let url = URL(string: urlString) else { return }
        
        if let imageFromCache = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error in requesting image from server with url: \(urlString)")
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                
                if self.imageUrlString == urlString {
                    if imageToCache != nil {
                        imageCache.setObject(imageToCache!, forKey: NSString(string: urlString))
                    }
                }
                self.image = imageToCache
            }
            
        }.resume()
    }
}
