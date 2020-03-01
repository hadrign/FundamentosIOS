//
//  CastTableViewCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 19/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    private var cast: Cast?
    var delegate: FavoriteRatingDelegate?
    
    override func awakeFromNib() {
        avatar.layer.cornerRadius = 8
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    
    func setCast(_ cast: Cast) {
        self.cast = cast
        let heartImageNamed = DataController.shared.isFavorite(cast) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageNamed)
        self.heart.setImage(heartImage, for: .normal)
        
        self.episodes.text = "\(cast.episodes ?? 0) episodes"
        self.role.text = cast.role
        self.name.text = cast.fullname
        self.avatar.image = UIImage.init(named: cast.avatar ?? "")
    }
    
    // MARK: - IBActions
    
    @IBAction func favoriteAction(_ sender: Any) {
        if let cast = self.cast {
            if DataController.shared.isFavorite(cast) {
                DataController.shared.removeFavorite(cast)
            } else {
                DataController.shared.addFavorite(cast)
            }
            delegate?.didFavoriteRatingChange()
        }
    }
}
