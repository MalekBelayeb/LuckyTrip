//
//  ViewDesignable.swift
//  LuckyTrip
//
//  Created by ODC on 24/4/2022.
//

import Foundation
import UIKit

@IBDesignable
class ViewDesignable:UIView
{
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cornerRadius
            
        }
        
    }
    
}
