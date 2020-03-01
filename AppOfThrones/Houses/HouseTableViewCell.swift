//
//  HouseTableViewCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 19/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scudo: UIImageView!
    @IBOutlet weak var seat: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var heart: UIButton!
    
    private var house: House?
    var delegate: FavoriteRatingDelegate?
    
    override func awakeFromNib() {
        scudo.layer.cornerRadius = 8
        scudo.layer.borderWidth = 1
        scudo.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setHouse(_ house: House) {
        
        self.house = house
        let heartImageNamed = DataController.shared.isFavorite(house) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageNamed)
        self.heart.setImage(heartImage, for: .normal)
        
        self.name.text = house.name
        self.seat.text = "Situation: \(house.seat ?? "")"
        self.words.text = house.words
        self.scudo.image = UIImage.init(named: house.imageName ?? "")
    }
    
    // MARK: - IBAction
    
    @IBAction func favoriteAction(_ sender: Any) {
        if let house = self.house {
            if DataController.shared.isFavorite(house) {
                DataController.shared.removeFavorite(house)
            } else {
                DataController.shared.addFavorite(house)
            }
            delegate?.didFavoriteRatingChange()
        }
    }
}
