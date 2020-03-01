//
//  CastDetailViewControllerCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 26/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class EpisodeDetailImageViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
        
    override func awakeFromNib() {
        episodeImage.layer.cornerRadius = 2.0
        episodeImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        episodeImage.layer.borderWidth = 1.0
    }
    
    func setEpisode(_ imagen: String) {
        
        episodeImage.image = UIImage.init(named: imagen )
    }
}
