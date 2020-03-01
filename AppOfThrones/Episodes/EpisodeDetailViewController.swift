//
//  CastDetailViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 26/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var episode: Episode?
    
    convenience init(withEpisode episode: Episode) {
        self.init()
        self.title = episode.name
        self.episode = episode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    // MARK: -SetUp
    
    func setUpUI() {
        self.title = self.episode?.name
        
        let nibImage = UINib.init(nibName: "EpisodeDetailImageViewControllerCell", bundle: nil)
        self.tableView.register(nibImage, forCellReuseIdentifier: "EpisodeDetailImageViewControllerCell")
        
        let nibData = UINib.init(nibName: "EpisodeDetailDataViewControllerCell", bundle: nil)
        self.tableView.register(nibData, forCellReuseIdentifier: "EpisodeDetailDataViewControllerCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - UITableViewDelegate
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let screenSize = UIScreen.main.bounds
            return screenSize.height / 2
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("pulsando en la celda ")
        }
        
        func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        // MARK: - UITableView Datasource
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailImageViewControllerCell", for: indexPath) as? EpisodeDetailImageViewControllerCell {
                    cell.setEpisode(episode?.image ?? "")
                    return cell
                }
                fatalError("Could not create the Episode Image Detail cell")
            } else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailDataViewControllerCell", for: indexPath) as? EpisodeDetailDataViewControllerCell {
                    cell.setEpisode(episode!)
                    return cell
                }
            
            }
            fatalError("Could not create the Episode Data Detail cell")
        }
        
    
}
