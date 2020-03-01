//
//  DataController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 17/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import Foundation

protocol FavoriteRatingDelegate: class {
    func didFavoriteRatingChange()
}

protocol Identifiable {
    var id: Int { get }
    
}

class DataController {
    
    //var rating: [Rating] = []
    
    static var shared = DataController()
    private init() {}
    
    private var rating: [Rating] = []
    private var favorite: [Int] = []
    
    // MARK: - Favorite
    
    func favoriteIsEmpty() -> Bool {
        if favorite.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func cleanFavorite() {
        favorite.removeAll()
        //favorite = []
    }
    
    func isFavorite<T: Identifiable>(_ value: T) -> Bool {
        return favorite.contains(value.id)
    }
    
    func addFavorite<T: Identifiable>(_ value: T) {
        if self.isFavorite(value) == false {
            favorite.append(value.id)
        }
    }
    
    func removeFavorite<T: Identifiable>(_ value: T) {
        if let index = favorite.firstIndex(of: value.id) {
            favorite.remove(at: index)
        }
    }
    
    
    
    
    // MARK: - Rating
    
    func cleanReviews() {
        rating.removeAll()
    }
    
    func rateEpisode(_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            let rateValue = Rating.init(id: episode.id, rate: Rate.rated(value: value))
            rating.append(rateValue)
        }
    }
    
    func removeRateEpisode(_ episode: Episode) {
        if let index = self.rating.firstIndex(where: {(rating) -> Bool in
            return episode.id == rating.id
        }) {
            self.rating.remove(at: index)
        }
    }
    
    func ratingForEpisode(_ episode: Episode) -> Rating? {
        let filtered = rating.filter {
            $0.id == episode.id
        }
        return filtered.first
    }
}
