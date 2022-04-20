//
//  InterestPlace.swift
//  LuckyTrip
//
//  Created by malek belayeb on 20/4/2022.
//

import Foundation

class PlacePoint:Decodable {
    
    var lon: Double?
    var lat: Double?
    
}

class InterestPlace:Decodable
{
    
    var xid : String?
    var name: String?
    var dist: Double?
    var kinds:String?
    var point:PlacePoint?
    
}
