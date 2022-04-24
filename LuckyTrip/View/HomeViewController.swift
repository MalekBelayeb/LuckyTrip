//
//  HomeViewController.swift
//  LuckyTrip
//
//  Created by malek belayeb on 14/4/2022.
//

import UIKit
import TagListView

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,PlaceOfInterestViewNotifier {
    
    func showLoadingView() {
        
        
        LoadingView.shared.showLoading(view: self.view)
        
    }
    
    func showAllPlaceOfInterest(interstPlaces:[InterestPlace]) {
    
        self.interstPlaces = interstPlaces
        self.numItems = interstPlaces.count
            
        self.tableView.reloadData()
    
    }
    
    func hideLoadingView() {
        
        LoadingView.shared.hideLoading()
    }
        
     
    var interstPlaces:[InterestPlace] = []
    var numItems : Int = 0
    let cities = ["Tunis","Sousse","Ariana","Bizerte","Sfax","Manouba"]
    let categories = ["Tunis","Sousse","Ariana","Bizerte","Sfax","Manouba"]

    let presenter:PlaceOfInterestPresenter = PlaceOfInterestPresenter(placeOfInterestService: PlaceOfinterestService())
    let cityButton = UIButton(configuration: .borderedProminent())
    var taglListView:TagListView = TagListView()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interstPlaces.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        
        view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: 200, height: 40))
        
        label.text = "Places of interest (" + self.numItems.description + ")"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "moveToDetail", sender: self.interstPlaces[indexPath.row])
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestPlaceTableViewCell", for: indexPath) as! InterestPlaceTableViewCell
        
        cell.placeTitle.text = self.interstPlaces[indexPath.row].name
        cell.placeDistance.text = (self.interstPlaces[indexPath.row].dist?.description ?? "0") + " m"
        cell.placeKinds.text = self.interstPlaces[indexPath.row].kinds?.description
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        
        self.presenter.placeOfInterestViewNotifier = self
        
        self.tableView.register(UINib.init(nibName: "InterestPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "InterestPlaceTableViewCell")
        
        self.createCityMenu(){
            item in
            
            self.cityButton.setTitle(item, for: .normal)
                        
        }
        
        //self.createTagListView()
        
        self.presenter.performGetListPresenter()
    
    }
    
    func createCityMenu(didSelect: @escaping (_ city:String) -> Void = {city in } )
    {
        
        var childrens : [UIMenuElement] = []
        
        self.cities.forEach{
            
            item in
                    
            childrens.append( UIAction(title:item,handler: {
                    item in
                    
                didSelect(item.title)
                
            }))
            
        }
        
        let menu = UIMenu(title:"Select a city",children: childrens)
        cityButton.setTitle("Select a city", for: .normal)
        cityButton.showsMenuAsPrimaryAction = true
        cityButton.menu = menu
        
        self.view.addSubview(cityButton)
        
        cityButton.translatesAutoresizingMaskIntoConstraints = false
        view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: cityButton.trailingAnchor, constant: 16).isActive = true
        cityButton.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 16).isActive = true
        
    }
   
    
    func createTagListView()
    {
            
        self.taglListView = TagListView()

        taglListView.backgroundColor = .brown
        
        self.categories.forEach{
            item in
            
        }
        
        let tag = TagView(title: "dfqfs")
        
        taglListView.addTagView(tag)
        
        self.view.addSubview(taglListView)
        
        taglListView.translatesAutoresizingMaskIntoConstraints = false
        
        taglListView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 16).isActive = true
        taglListView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: taglListView.trailingAnchor, constant: 16).isActive = true
        
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        if segue.identifier == "moveToDetail"
        {
            if let destination = segue.destination as? InterestPlaceDetailViewController
            {
                if let sender = sender as? InterestPlace
                {
                    destination.placeOfInterest = sender
                }
            }
            
        }
        
    }
    

}
