//
//  CastDetatilViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 28/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

class CastDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cast: Cast?
    
    convenience init(withCast cast: Cast) {
        self.init()
        self.title = cast.fullname
        self.cast = cast
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    // MARK: -SetUp
    
    func setUpUI() {
        self.title = self.cast?.fullname
        
        let nibImage = UINib.init(nibName: "CastDetailImageTableCell", bundle: nil)
        self.tableView.register(nibImage, forCellReuseIdentifier: "CastDetailImageTableCell")
        
        let nibData = UINib.init(nibName: "CastDetailDataTableCell", bundle: nil)
        self.tableView.register(nibData, forCellReuseIdentifier: "CastDetailDataTableCell")
        
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
                if let cell = tableView.dequeueReusableCell(withIdentifier: "CastDetailImageTableCell", for: indexPath) as? CastDetailImageTableCell {
                    cell.setImageCast(cast?.avatar ?? "")
                    return cell
                }
                fatalError("Could not create the Episode Image Detail cell")
            } else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "CastDetailDataTableCell", for: indexPath) as? CastDetailDataTableCell {
                    cell.setDataCast(cast!)
                    return cell
                }
            
            }
            fatalError("Could not create the Episode Data Detail cell")
        }
}
