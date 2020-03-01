//
//  HouseViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 13/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteRatingDelegate {
        
    
    @IBOutlet weak var tableView: UITableView!
    
    var house: [House] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setUpNotification()
        self.setUpData()
        
       
    }
    
    // MARK: - Setup
    
    func setupUI() {
        self.title = "Houses"
        
        let nib = UINib.init(nibName: "HouseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HouseTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpNotification() {
        let noteName = Notification.Name(rawValue: "DidFavoritesRatingUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteRatingChange), name: noteName, object: nil)
    }
    
    func setUpData() {
        if let pathURL = Bundle.main.url(forResource: "houses", withExtension: "json"){
            do{
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                house = try decoder.decode([House].self, from: data)
                self.tableView.reloadData()
            } catch{
                fatalError("Could not read the JSON")
            }
        } else {
            fatalError("Could not build the path url")
        }
        
    }
    
    // MARK: - HouseTableViewCellDelegate
    @objc func didFavoriteRatingChange() {
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 139
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = self.house[indexPath.row]
        let houseDetailVC = HouseDetailViewController.init(withHouse: house)
        self.navigationController?.pushViewController(houseDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableView Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return house.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseTableViewCell", for: indexPath) as? HouseTableViewCell {
            let king = house[indexPath.row]
            cell.setHouse(king)
            cell.delegate = self
            return cell
        }
        fatalError("Could not create the Cast cell")
    }
        
}
