//
//  Rating.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 20/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
    
}

struct Rating: CustomStringConvertible, Equatable {
    
    var id: Int
    var rate: Rate
    var description: String {
      return "Episode ID: \(id), with the following rate \(rate)."
    }
    
    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return lhs.id == rhs.id
    }
}
