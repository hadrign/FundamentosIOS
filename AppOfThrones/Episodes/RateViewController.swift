//
//  RateViewController.swift
//  AppOfThrones
//
//  Created by Hadrian Grille Negreira on 11/02/2020.
//  Copyright © 2020 Hadrian Grille Negreira. All rights reserved.
//

import UIKit

protocol RateViewControllerDelegate {
    func didRateChange()
}

class RateViewController: UIViewController {
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    @IBOutlet weak var rateSlider: UISlider!
    
    private var episode: Episode?
    var delegate: RateViewControllerDelegate?
    
    convenience init(withEpisode episode: Episode) {
        self.init()
        self.episode = episode
        self.title = episode.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        rateLabel.textColor = UIColor.red
        confirmButton.layer.cornerRadius = 4.0
        self.imageView.image = UIImage.init(named: self.episode?.image ?? "")
    }
    
    
    // MARK: - IBActions
    
    @IBAction func accept(_ sender: Any) {
        print("Accept!")
        
        let rate = Double(Int(rateSlider.value*5)/10)
        if let episode = self.episode {
            DataController.shared.rateEpisode(episode, value: rate)
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
        self.delegate?.didRateChange()
    }
    
    @IBAction func sliderFIre(_ sender: UISlider) {
        let rate = Double(Int((sender.value * 5)/10))
        self.setRating(rate)
    }
    
    
    @IBAction func close(_ sender: Any) {
        //print("Fire!!")
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Rating
    
    func setRating(_ rating: Double) {
        rateLabel.text = String(rating)
        self.setStarImage(star01, rating: rating, minValue: 0)
        self.setStarImage(star02, rating: rating, minValue: 2)
        self.setStarImage(star03, rating: rating, minValue: 4)
        self.setStarImage(star04, rating: rating, minValue: 6)
        self.setStarImage(star05, rating: rating, minValue: 8)
    }
    
    func setStarImage(_ imageView: UIImageView, rating: Double, minValue: Double) {
        
        
        if rating >= minValue + 1.0 && rating < minValue + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= minValue + 2.0 {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
    }
    
}
