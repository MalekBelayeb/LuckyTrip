//
//  InterestPlaceDetail.swift
//  LuckyTrip
//
//  Created by ODC on 24/4/2022.
//

import Foundation



class AdressPOI:Decodable
{
    var city:String?
    var state:String?
    var county:String?
    var suburb:String?
    var country:String?
    var state_district:String?
    
}

class ImagePOI:Decodable
{
    var source:String?
    var height:Double?
    var width:Double?
}

class WikipediaExtracts:Decodable
{
    var title:String?
    var text:String?
    
}

class PointPoi:Decodable
{
    var lon:Double?
    var lat:Double?
}

class InterestPlaceDetail:Decodable
{
    
    var name:String?
    var address:AdressPOI?
    var kinds:String?
    var wikipedia:String?
    var preview:ImagePOI?
    var wikipedia_extracts:WikipediaExtracts?
    var point:PointPoi?
    
}
