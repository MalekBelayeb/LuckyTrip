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
    
    func performGetListPresenter()
    {

        self.placeOfInterestViewNotifier.showLoadingView()
        
        Task
        {
            
            let result = try? await self.placeOfInterestService.getListPlacesOfInterest(url: "https://api.opentripmap.com/0.1/en/places/radius?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9&radius=30000&lon=10.63699&lat=35.82539&rate=3&format=json", httpMethod: "GET")

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
                
            }
            
        }
        
        
    }
       
   
}

