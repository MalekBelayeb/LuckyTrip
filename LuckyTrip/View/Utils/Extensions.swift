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


extension UIView {
    
    func applyLayerGradient() {
        let layer : CAGradientLayer = CAGradientLayer()
        
        layer.frame.size =  CGSize(width: self.frame.width, height: self.frame.height)
        layer.frame.origin = CGPoint(x: 0.0,y: 0.0)
        layer.cornerRadius = 4

        let color0 = UIColor.clear.cgColor
        let color1 = UIColor.black.withAlphaComponent(0.9).cgColor

        layer.colors = [color0,color1]
        self.layer.sublayers = [layer]
    }
    
}
