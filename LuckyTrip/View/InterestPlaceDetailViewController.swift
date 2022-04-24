//
//  InterestPlaceDetailViewController.swift
//  LuckyTrip
//
//  Created by malek belayeb on 21/4/2022.
//

import UIKit

class InterestPlaceDetailViewController: UIViewController,PlaceOfInterestDetailViewNotifier {
    
    
    func showLoadingView() {
        
        LoadingView.shared.showLoading(view: self.view)

    }
    
    func showPOIDetail(pointOfInterest: InterestPlaceDetail) {
        
        self.imagePOI.downloadImage(from: pointOfInterest.preview?.source ?? "")
        self.descriptionPOI.text = pointOfInterest.wikipedia_extracts?.text
        self.categoryPOI.text = (pointOfInterest.kinds ?? "").split(separator: ",").prefix(3).joined(separator: ",")
        self.addressPOI.text = (pointOfInterest.address?.country ?? "") + "," + (pointOfInterest.address?.state ?? "")
        self.titlePOI.text = pointOfInterest.name ?? ""
        
    }
    
    func hideLoadingView() {
        
        LoadingView.shared.hideLoading()

    }
    
    @IBOutlet weak var titlePOI: UILabel!
    @IBOutlet weak var descriptionPOI: UITextView!
    
    var placeOfInterest : InterestPlace?
    
    @IBOutlet weak var imagePOI: UIImageView!
    
    @IBOutlet weak var addressPOI: UILabel!
    @IBOutlet weak var categoryPOI: UILabel!
    
    var presenter:InterestPlaceOfInterestDetailPresenter = InterestPlaceOfInterestDetailPresenter(placeOfInterestService: PlaceOfinterestService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.placeOfInterestDetailViewNotifier = self
        
        self.presenter.performGetPOIById(id: self.placeOfInterest?.xid)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
