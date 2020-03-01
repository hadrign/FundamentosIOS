//
//  HouseDetailDataTableCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 01/03/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class HouseDetailDataTableCell: UITableViewCell {
    
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseWords: UILabel!
    @IBOutlet weak var houseSeat: UILabel!
    
    
    private var house: House?
    
    override func awakeFromNib() {
     
    }
    
    func setDataHouse(_ house: House) {
        self.house = house
        
        houseName.text = house.name
        houseWords.text = house.words
        houseSeat.text = house.seat
        
    }
}
