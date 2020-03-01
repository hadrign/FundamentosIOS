//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 13/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    @IBAction func cleanFavoritesAction(_ sender: Any) {
        DataController.shared.cleanFavorite()
        self.launchNotification()
        let noteName = Notification.Name(rawValue: "DidFavoritesEpisodeUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    
    
    @IBAction func cleanReviewsAction(_ sender: Any) {
        DataController.shared.cleanReviews()
        self.launchNotification()
//        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
//        NotificationCenter.default.post(name: noteName, object: nil)
        
    }
    
    
    func launchNotification() {
        let noteName = Notification.Name(rawValue: "DidFavoritesRatingUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
}
