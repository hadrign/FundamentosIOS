//
//  HouseDetailImageTableCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 01/03/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit
class HouseDetaillImageTableCell: UITableViewCell {
    
    @IBOutlet weak var houseImage: UIImageView!
    
    override func awakeFromNib() {
        houseImage.layer.cornerRadius = 2.0
        houseImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        houseImage.layer.borderWidth = 1.0
    }
    
    func setImageHouse(_ imagen: String) {
        
        houseImage.image = UIImage.init(named: imagen )
    }
}
