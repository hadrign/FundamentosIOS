//
//  EpisodeDetailDataViewControllerCell.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 26/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class EpisodeDetailDataViewControllerCell: UITableViewCell {
       @IBOutlet weak var episodeName: UILabel!
       @IBOutlet weak var episodeDate: UILabel!
       @IBOutlet weak var episodeSeason: UILabel!
       @IBOutlet weak var episodeOverview: UITextView!
       
       
       private var episode: Episode?
       
       override func awakeFromNib() {
        
       }
       
       func setEpisode(_ episode: Episode) {
           self.episode = episode
           
           episodeName.text = episode.name
           episodeDate.text = "Date: \(episode.date ?? "")"
           episodeSeason.text = "Season: \(episode.season) - episode: \(episode.episode)"
           episodeOverview.text = episode.overview
           
       }
}
