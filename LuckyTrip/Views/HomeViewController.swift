//
//  HomeViewController.swift
//  LuckyTrip
//
//  Created by malek belayeb on 14/4/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func btnDidTapped(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "mySegue", sender: "sss")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        
        print(sender)
        
    }
    

}
