//
//  InterestPlaceDetailViewController.swift
//  LuckyTrip
//
//  Created by malek belayeb on 21/4/2022.
//

import UIKit
import WebKit

class InterestPlaceDetailViewController: UIViewController,PlaceOfInterestDetailViewNotifier,WKNavigationDelegate {
    
    
    func showLoadingView() {
        
        LoadingView.shared.showLoading(view: self.view)

    }
    
    func showPOIDetail(pointOfInterest: InterestPlaceDetail) {
        
        self.imagePOI.downloadImage(from: pointOfInterest.preview?.source ?? "")
        self.descriptionPOI.text = pointOfInterest.wikipedia_extracts?.text
        self.categoryPOI.text = (pointOfInterest.kinds ?? "").split(separator: ",").prefix(3).joined(separator: ",")
        self.addressPOI.text = (pointOfInterest.address?.country ?? "") + "," + (pointOfInterest.address?.state ?? "")
        self.titlePOI.text = pointOfInterest.name ?? ""
        self.wikipediaUrl = pointOfInterest.wikipedia
    }
    
    func hideLoadingView() {
        
        LoadingView.shared.hideLoading()

    }
    
    @IBOutlet weak var titlePOI: UILabel!
    @IBOutlet weak var descriptionPOI: UITextView!
    
    var placeOfInterest : InterestPlace?
    var wikipediaUrl:String?
    
    @IBOutlet weak var imagePOI: UIImageView!
    
    @IBOutlet weak var addressPOI: UILabel!
    @IBOutlet weak var categoryPOI: UILabel!
    
    var webView: WKWebView!

    var presenter:InterestPlaceOfInterestDetailPresenter = InterestPlaceOfInterestDetailPresenter(placeOfInterestService: PlaceOfinterestService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.placeOfInterest?.name ?? ""
        //self.webView.navigationDelegate = self
        
        self.presenter.placeOfInterestDetailViewNotifier = self
        
        self.presenter.performGetPOIById(id: self.placeOfInterest?.xid)
        
    }
    
    @IBAction func wikipediaDidTapped(_ sender: Any) {
    
        self.performSegue(withIdentifier: "moveToWebkit", sender: self.wikipediaUrl)
    
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        guard let wikipediaUrl = sender as? String else {
            return
        }
        
        if segue.identifier == "moveToWebkit"
        {
            if let destination = segue.destination as? WikipediaWKViewController
            {
                destination.urlWiki = wikipediaUrl
            }
        }
    
    }
    

}
