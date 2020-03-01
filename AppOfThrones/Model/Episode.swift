//
//  Episode.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 13/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import Foundation

class Episode: Identifiable, Codable, CustomStringConvertible, Equatable {
    
    var id: Int
    var name: String?
    var date: String?
    var image: String?
    var episode: Int
    var season: Int
    var overview: String
    var description: String {
      return "Episode name: \(name ?? ""), emited the \(date ?? "") and this is the episode number \(episode) from season \(season)"
    }
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
           return
            lhs.id == rhs.id &&
                lhs.name == rhs.name &&
                lhs.date == rhs.date &&
                lhs.episode == rhs.episode &&
                lhs.season == rhs.season
       }
    
    init(id: Int, name: String?, date: String?, image: String?, episode: Int, season: Int, overview: String) {
        self.id = id
        self.name = name
        self.date = date
        self.image = image
        self.episode = episode
        self.season = season
        self.overview = overview
    }
    
}
