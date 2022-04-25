//
//  SettingsViewController.swift
//  LuckyTrip
//
//  Created by ODC on 25/4/2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    var sliderValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.countLabel.text = PreferencesUtils.getRadiusValue().description + " m"
        self.slider.value = Float(PreferencesUtils.getRadiusValue()) / 50000
    
    }
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBAction func sliderAction(_ sender: Any) {
                
        self.countLabel.text = String(format: "%.0f", slider.value*50000) + " m"
        
        self.sliderValue = Int(self.slider.value * 50000)
        
    }
    
    
    @IBAction func sliderDidEnded(_ sender: Any) {
        
        PreferencesUtils.setRadiusValue(radius: self.sliderValue)
        
        
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
