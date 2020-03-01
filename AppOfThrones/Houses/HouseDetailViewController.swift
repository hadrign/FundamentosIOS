//
//  HouseDetailViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 01/03/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var house: House?
    
    convenience init(withHouse house: House) {
        self.init()
        self.title = house.name
        self.house = house
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    // MARK: -SetUp
    
    func setUpUI() {
        self.title = self.house?.name
        
        let nibImage = UINib.init(nibName: "HouseDetailImageTableCell", bundle: nil)
        self.tableView.register(nibImage, forCellReuseIdentifier: "HouseDetailImageTableCell")
        
        let nibData = UINib.init(nibName: "HouseDetailDataTableCell", bundle: nil)
        self.tableView.register(nibData, forCellReuseIdentifier: "HouseDetailDataTableCell")
        
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
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseDetailImageTableCell", for: indexPath) as? HouseDetaillImageTableCell {
                    cell.setImageHouse(house?.imageName ?? "")
                    return cell
                }
                fatalError("Could not create the Episode Image Detail cell")
            } else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseDetailDataTableCell", for: indexPath) as? HouseDetailDataTableCell {
                    cell.setDataHouse(house!)
                    return cell
                }
            
            }
            fatalError("Could not create the Episode Data Detail cell")
        }

}
