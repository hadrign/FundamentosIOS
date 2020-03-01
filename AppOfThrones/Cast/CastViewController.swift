//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 13/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class  CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteRatingDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var cast: [Cast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setUpNotification()
        self.setUpData()
       
    }
    
    // MARK: - Setup
    
    func setupUI() {
        self.title = "Cast"
        
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpNotification() {
        let noteName = Notification.Name(rawValue: "DidFavoritesRatingUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteRatingChange), name: noteName, object: nil)
    }
    
    func setUpData() {
        if let pathURL = Bundle.main.url(forResource: "cast", withExtension: "json"){
            do{
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                cast = try decoder.decode([Cast].self, from: data)
                self.tableView.reloadData()
                //cast
            } catch{
                fatalError("Could not read the JSON")
            }
        } else {
            fatalError("Could not build the path url")
        }
        
    }
    
    // MARK: - CastTableViewCellDelegate
    
    @objc func didFavoriteRatingChange() {
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actor = cast[indexPath.row]
        let castDetailVC = CastDetailViewController.init(withCast: actor)
        self.navigationController?.pushViewController(castDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableView Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell {
            let actor = cast[indexPath.row]
            cell.setCast(actor)
            cell.delegate = self
            return cell
        }
        fatalError("Could not create the Cast cell")
    }
    
}
