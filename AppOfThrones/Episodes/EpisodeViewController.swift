//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 13/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit


class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate, FavoriteRatingDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpNotification()
        self.setUpData(1)
        
    }
    
    deinit {
//        let noteName = Notification.Name(rawValue: "DidFavoritesUpdate")
//        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    func setUpUI() {
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func setUpNotification() {
        let noteName = Notification.Name(rawValue: "DidFavoritesRatingUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteRatingChange), name: noteName, object: nil)
    }
    
    func setUpData(_ seasonNumber: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json"){
            do{
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                episodes = try decoder.decode([Episode].self, from: data)
                self.tableView.reloadData()
            } catch{
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Could not build the path url")
        }
    }
    
    @objc func didFavoriteRatingChange() {
        self.tableView.reloadData()
    }

    @IBAction func rateButton(_ sender: Any) {
        let rateViewController = RateViewController()
        self.present(rateViewController, animated: true, completion: nil)
    }
    
    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        let seasonNumber = sender.selectedSegmentIndex + 1
        self.setUpData(seasonNumber)
    }
    
    // MARK: - EpisodeTableViewCellDelegate
    
    func didRateChange() {
        self.tableView.reloadData()
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let rateViewController = RateViewController()
//        self.present(rateViewController, animated: true, completion: nil)
        let episode = episodes[indexPath.row]
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
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let ep = episodes[indexPath.row]
            cell.setEpisode(ep)
            //print(ep)
            cell.delegate = self
            cell.rateBlock = {() -> Void in
                let rateViewController = RateViewController.init(withEpisode: ep)
                rateViewController.delegate = self
                let navigationController = UINavigationController.init(rootViewController: rateViewController)
                self.present(navigationController, animated: true, completion: nil)
            }
            return cell
        }
        fatalError("Could not create the Episode cell")
    }
    
    
    
    
}
