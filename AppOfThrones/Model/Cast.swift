//
//  Cast.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 17/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import Foundation

struct Cast: Identifiable, Codable, CustomStringConvertible, Equatable {
    
    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
    var description: String {
      return "Actor name: \(fullname ?? ""), acting as \(role ?? "") in \(episodes ?? 0) episodes."
    }
    
    static func == (lhs: Cast, rhs: Cast) -> Bool {
        return lhs.id == rhs.id && lhs.fullname == rhs.fullname && lhs.role == rhs.role && lhs.birth == rhs.birth
    }
    
}
