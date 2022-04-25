//
//  PreferencesUtils.swift
//  LuckyTrip
//
//  Created by ODC on 25/4/2022.
//

import Foundation



class PreferencesUtils
{

    static let prefs = UserDefaults.standard
    
    static func setRadiusValue(radius:Int)
    {
            
        prefs.set(radius, forKey: "radius")
        prefs.synchronize()
        
    }
    
    static func getRadiusValue() -> Int
    {
        
        return prefs.integer(forKey: "radius") ?? 0
        
    }
    
}
