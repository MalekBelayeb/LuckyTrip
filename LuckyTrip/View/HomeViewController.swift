//
//  HomeViewController.swift
//  LuckyTrip
//
//  Created by malek belayeb on 14/4/2022.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var interstPlaces:[InterestPlace] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interstPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestPlaceTableViewCell", for: indexPath) as! InterestPlaceTableViewCell
        
        cell.placeTitle.text = self.interstPlaces[indexPath.row].name
        cell.placeDistance.text = self.interstPlaces[indexPath.row].dist?.description
        cell.placeKinds.text = self.interstPlaces[indexPath.row].kinds?.description
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        
        print(sender)
        
    }
    

}
