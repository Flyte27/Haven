//
//  AnimalBasicCell.swift
//  Haven
//
//  Created by Alex Payne on 2018-04-17.
//  Copyright © 2018 Alex Payne. All rights reserved.
//

import UIKit

class AnimalBasicCell: UITableViewCell {
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cutenessLabel: UILabel!
    
    override func awakeFromNib() {
        animalImageView.layer.cornerRadius = 5.0
        animalImageView.layer.masksToBounds = true
    }
    
    func populate(animal: Animal) {
        animalImageView.image = animal.image ?? UIImage(named: "dog-icon")
        nameLabel.text = animal.name
        cutenessLabel.text = String.getCutenessString()
    }
}
