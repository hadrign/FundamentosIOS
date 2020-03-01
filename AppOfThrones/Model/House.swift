//
//  House.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 18/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import Foundation

struct House: Identifiable, Codable, CustomStringConvertible, Equatable {
    
    var id: Int
    var imageName: String?
    var name: String?
    var words: String?
    var seat: String?
    var description: String {
      return "House name: \(name ?? ""), with the following words \(words ?? "") seat in \(seat ?? "")."
    }
    
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}
