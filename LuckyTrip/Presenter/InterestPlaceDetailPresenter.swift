//
//  InterestPlaceDetailPresenter.swift
//  LuckyTrip
//
//  Created by ODC on 23/4/2022.
//

import Foundation

protocol PlaceOfInterestDetailViewNotifier
{
    
    func showLoadingView()
    func showPOIDetail(pointOfInterest:InterestPlaceDetail)
    func hideLoadingView()
    
}

class InterestPlaceOfInterestDetailPresenter
{
    
    var placeOfInterestService : PlaceOfinterestService
    var placeOfInterestDetailViewNotifier:PlaceOfInterestDetailViewNotifier!

    init(placeOfInterestService : PlaceOfinterestService)
    {
        self.placeOfInterestService = placeOfInterestService
    }
    
    func performGetPOIById(id:String?)
    {

        guard let id = id else {
            return
        }
        
        self.placeOfInterestDetailViewNotifier.showLoadingView()

        Task
        {
            
            let result = try? await self.placeOfInterestService.getPlaceOfInterestById(url: "https://api.opentripmap.com/0.1/en/places/xid/" + id + "?apikey=" + Const.API_KEY, httpMethod: "GET")
            
            if let result = (result as? InterestPlaceDetail)
            {
                
                DispatchQueue.main.async {
                    
                    self.placeOfInterestDetailViewNotifier.showPOIDetail(pointOfInterest: result)
                    self.placeOfInterestDetailViewNotifier.hideLoadingView()

                }
                
            }
            
        }
        
        
    }
    
}

