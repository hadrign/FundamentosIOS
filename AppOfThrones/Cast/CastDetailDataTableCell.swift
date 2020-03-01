//
//  CastDetailDataTableCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 28/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class CastDetailDataTableCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var placeBirth: UILabel!
    @IBOutlet weak var epiodes: UILabel!
    
    private var actor: Cast?
    
    override func awakeFromNib() {
     
    }
    
    func setDataCast(_ cast: Cast) {
        self.actor = cast
        
        name.text = actor?.fullname
        role.text = actor?.role
        birth.text = "Birth: \(actor?.birth ?? "")"
        placeBirth.text = "Birth place: \(actor?.placeBirth ?? "")"
        epiodes.text = "Episodes: \(actor?.episodes ?? 0)"
        
    }
    
}
