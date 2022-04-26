//
//  MapViewViewController.swift
//  LuckyTrip
//
//  Created by ODC on 26/4/2022.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
    
        self.title = title
        self.coordinate = coordinate
        self.info = info
    
    }
    
}

class MapViewViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //42.997581, 12.784165
        //42.451381, 13.059208
        let initialLocation = CLLocation(latitude: 42.997581, longitude: 12.784165)
        
        self.mapView.centerCoordinate = initialLocation.coordinate
       
        
        self.mapView.delegate = self
        self.mapView.isScrollEnabled = true
        self.mapView.isZoomEnabled = true
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        
        annotation.title = "sddsdsds "
        
        annotation.subtitle = "subtitle qsdqdd qsqs qd qsd qsd qsd sqd dq sdd qs qdq"
        
        self.mapView.addAnnotation(annotation)
        
        
        
        destinationTo(coord:  CLLocation(latitude: 42.451381, longitude:  13.059208).coordinate , source: initialLocation.coordinate)
    
    }
    
    func destinationTo(coord:CLLocationCoordinate2D,source:CLLocationCoordinate2D)
    {
        let sourcePlacemark = MKPlacemark(coordinate: source)
        let destionationPlacemark = MKPlacemark(coordinate: coord)
        
        
        let destItem = MKMapItem(placemark: destionationPlacemark)
        let sourceItem = MKMapItem(placemark: sourcePlacemark)

        let destinationRequest = MKDirections.Request()
        
        destinationRequest.source = sourceItem
        destinationRequest.destination = destItem
        destinationRequest.transportType = .automobile
        
        let directions = MKDirections(request: destinationRequest)
        directions.calculate(completionHandler: {
         response, error in
            
            print(error)
            
            guard let response = response else { return }
            
            let route = response.routes[0]
            
            self.mapView.addOverlay(route.polyline)
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            
        
        })
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .red
        return renderer
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
