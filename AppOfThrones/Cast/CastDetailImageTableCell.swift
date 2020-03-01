//
//  CastDetailImageTableCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 28/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class CastDetailImageTableCell: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        avatar.layer.cornerRadius = 2.0
        avatar.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        avatar.layer.borderWidth = 1.0
    }
    
    func setImageCast(_ imagen: String) {
        
        avatar.image = UIImage.init(named: imagen )
    }
}
