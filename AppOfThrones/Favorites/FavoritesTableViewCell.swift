//
//  FavoritesTableViewCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 29/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit


class FavoritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeDate: UILabel!
    
    
    private var episode: Episode?
    var delegate: FavoriteRatingDelegate?
    
    
    override func awakeFromNib() {
        episodeImage.layer.cornerRadius = 2.0
        episodeImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        episodeImage.layer.borderWidth = 1.0
    }
    
    
    func setEpisodeFavorite(_ episode: Episode) {
        self.episode = episode
        
        episodeImage.image = UIImage.init(named: episode.image ?? "")
        episodeTitle.text = episode.name
        episodeSeason.text = "Season \(episode.season), episode \(episode.episode)"
        episodeDate.text = episode.date
    }
    
}
