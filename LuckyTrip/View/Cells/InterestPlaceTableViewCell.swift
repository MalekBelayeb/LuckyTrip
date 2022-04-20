//
//  InterestPlaceTableViewCell.swift
//  LuckyTrip
//
//  Created by malek belayeb on 20/4/2022.
//

import UIKit

class InterestPlaceTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var placeTitle: UILabel!
    
    @IBOutlet weak var placeKinds: UILabel!
    
    @IBOutlet weak var placeDistance: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
