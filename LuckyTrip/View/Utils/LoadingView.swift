//
//  LoadingView.swift
//  LuckyTrip
//
//  Created by ODC on 23/4/2022.
//

import Foundation
import UIKit



class LoadingView
{
    
    static let shared = LoadingView()
    
   lazy var activityIndicator : UIActivityIndicatorView = {
        
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        
        activityIndicator.center = self.loadingContainerView.center
        
        activityIndicator.startAnimating()
        
        return activityIndicator
    }()
    
    
    var loadingContainerView:UIView = {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        view.backgroundColor = .gray
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        return view
        
    }()
    
    
    func showLoading(view:UIView)
    {
        
        loadingContainerView.addSubview(self.activityIndicator)
        view.addSubview(loadingContainerView)
        
        loadingContainerView.center = view.center
        
    }
    
    
    func hideLoading()
    {
        self.loadingContainerView.removeFromSuperview()
    }
}
