//
//  Extensions.swift
//  LuckyTrip
//
//  Created by ODC on 24/4/2022.
//

import Foundation
import UIKit

extension UIImageView
{
    
    func downloadImage(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
            contentMode = mode
        guard let url = URL(string: link) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
    
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            
            }.resume()
        }
    
    
}
