//
//  PlaceOfInterestService.swift
//  LuckyTrip
//
//  Created by ODC on 23/4/2022.
//

import Foundation



class PlaceOfinterestService
{
 
    
    func getListPlacesOfInterest(url:String,httpMethod:String,headerFields:[String:String] = [:]) async throws -> Any?
    {
        
        guard let url = URL(string: url) else { return nil }
            
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.allHTTPHeaderFields = headerFields
            
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        if let response = (response as? HTTPURLResponse)
        {
            
            if response.statusCode == 200
            {
                
                return try JSONDecoder().decode([InterestPlace].self, from: data)
                
            }else{

                return nil
                
            }
            
        }else{

            return nil

        }
        

    }
    
    
    func getPlaceOfInterestById(url:String,httpMethod:String,headerFields:[String:String] = [:]) async throws -> Any?
    {
        
        guard let url = URL(string: url) else { return nil }
            
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.allHTTPHeaderFields = headerFields
            
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        if let response = (response as? HTTPURLResponse)
        {
            
            if response.statusCode == 200
            {
                
                return try JSONDecoder().decode(InterestPlaceDetail.self, from: data)
                
            }else{

                return nil
                
            }
            
        }else{

            return nil

        }
        

    }
    
    
    
    func getRegionByName(url:String,httpMethod:String,headerFields:[String:String] = [:]) async throws -> Any?
    {
        
        guard let url = URL(string: url) else { return nil }
            
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        urlRequest.allHTTPHeaderFields = headerFields
            
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        if let response = (response as? HTTPURLResponse)
        {
            
            if response.statusCode == 200
            {
                
                return try JSONDecoder().decode(Region.self, from: data)
                
            }else{

                return nil
                
            }
            
        }else{

            return nil

        }
        

    }
    
}
