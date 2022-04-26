//
//  InterestPlacePresenter.swift
//  LuckyTrip
//
//  Created by malek belayeb on 21/4/2022.
//

import Foundation


protocol PlaceOfInterestViewNotifier
{
    
    func showLoadingView()
    func showAllPlaceOfInterest(interstPlaces:[InterestPlace])
    func hideLoadingView()
    
}


class PlaceOfInterestPresenter
{

    var placeOfInterestViewNotifier:PlaceOfInterestViewNotifier!
    
    var placeOfInterestService : PlaceOfinterestService
    
    init(placeOfInterestService : PlaceOfinterestService)
    {
        self.placeOfInterestService = placeOfInterestService
    }
    
    func performGetListPresenter(region:String = "",radius:Int = 3000, lon:Double = 10.63699, lat :Double = 35.82539,kinds:[String] = [])
    {

        self.placeOfInterestViewNotifier.showLoadingView()
        let radius = PreferencesUtils.getRadiusValue()
        
        Task
        {
            
            var url = ""

            if region == ""
            {
                
                url = Const.GET_PLACES + "/radius?apikey=" + Const.API_KEY + "&radius=\(radius)&lon=\(lon)&lat=\(lat)&rate=3&format=json"
            
            }else {

                let urlRegion = Const.GET_REGION + "?apikey=" + Const.API_KEY + "&name=" + region
                
                let regionResult = try? await self.placeOfInterestService.getRegionByName(url: urlRegion, httpMethod: "GET")

                if let regionResult = (regionResult as? Region) {
                    
                    url = Const.GET_PLACES + "/radius?apikey=" + Const.API_KEY + "&radius=\(radius)&lon=\(regionResult.lon ?? 0)&lat=\(regionResult.lat ?? 0)&rate=3&format=json"
                    
                }else{
                    
                }
                
            }
            
            
            url = kinds.isEmpty ? url : url + "&kinds=" + kinds.joined(separator: ",")
            
            let result = try? await self.placeOfInterestService.getListPlacesOfInterest(url: url, httpMethod: "GET")
        
            if let list = (result as? [InterestPlace])
            {

                /*let mylist:[InterestPlace] = list.map{
                    
                    $0.dist = Double(String(format: "%.2f",$0.dist ?? 0))
                    $0.kinds = ($0.kinds ?? "").split(separator: ",").prefix(3).joined(separator: ",")
                    var interestPlace = InterestPlace()
                    
                    return interestPlace
                }*/
                
                list.map{
                    
                    $0.dist = Double(String(format: "%.2f",$0.dist ?? 0))
                    $0.kinds = ($0.kinds ?? "").split(separator: ",").prefix(3).joined(separator: ",")
                
                }
                
                DispatchQueue.main.async {
                    self.placeOfInterestViewNotifier.showAllPlaceOfInterest(interstPlaces: list)
                    self.placeOfInterestViewNotifier.hideLoadingView()

                }
                
            }else {
                
                DispatchQueue.main.async {
                 
                    self.placeOfInterestViewNotifier.hideLoadingView()

                }
            }
            
        }
        
        
    }
       
}

