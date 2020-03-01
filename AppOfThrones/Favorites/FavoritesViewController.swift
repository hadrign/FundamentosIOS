//
//  FavoritesViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 28/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteRatingDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    

    var episodesFavorites: [Episode] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setUpUI()
            self.setUpNotification()
            //self.setUpData()
            
        }
        
        deinit {
    //        let noteName = Notification.Name(rawValue: "DidFavoritesUpdate")
    //        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
        }
        
        func setUpUI() {
            self.title = "Favorites"
            
//            if DataController.shared.favoriteIsEmpty() {
//                let nib = UINib.init(nibName: "FavoritesTableViewCell", bundle: nil)
//                self.tableView.register(nib, forCellReuseIdentifier: "FavoritesTableViewCell")
//                self.tableView.delegate = self
//                self.tableView.dataSource = self
//            }
            let nib = UINib.init(nibName: "FavoritesTableViewCell", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: "FavoritesTableViewCell")
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
        }
        
        func setUpNotification() {
            let noteName = Notification.Name(rawValue: "DidFavoritesEpisodeUpdated")
            NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteRatingChange), name: noteName, object: nil)
        }
        
        func setUpData() {
            for seasonNumber in 1...8 {
                if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json"){
                    do{
                        let data = try Data.init(contentsOf: pathURL)
                        let decoder = JSONDecoder()
                        let episodes = try decoder.decode([Episode].self, from: data)
                        for ep in episodes {
                            if DataController.shared.isFavorite(ep) {
                                episodesFavorites.append(ep)
                            }
                        }
                        self.tableView.reloadData()
                    } catch{
                        fatalError(error.localizedDescription)
                    }
                } else {
                    fatalError("Could not build the path url")
                }
            }
        }
        
        @objc func didFavoriteRatingChange() {
            episodesFavorites = []
            self.setUpData()
            //self.tableView.reloadData()
        }
        
        
        // MARK: - UITableViewDelegate
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 123
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let rateViewController = RateViewController()
    //        self.present(rateViewController, animated: true, completion: nil)
            let episode = episodesFavorites[indexPath.row]
            let episodeDetailVC = EpisodeDetailViewController.init(withEpisode: episode)
            self.navigationController?.pushViewController(episodeDetailVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        // MARK: - UITableView Datasource
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return episodesFavorites.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell {
                let ep = episodesFavorites[indexPath.row]
                cell.setEpisodeFavorite(ep)
                //print(ep)
                cell.delegate = self
                return cell
            }
            fatalError("Could not create the Favorite cell")
        }

}
