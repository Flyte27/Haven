//
//  Animal.swift
//  Haven
//
//  Created by Alex Payne on 2018-04-17.
//  Copyright © 2018 Alex Payne. All rights reserved.
//

import UIKit

enum AnimalType {
    case dog, cat, critter
}
class Animal: NSObject {
    var id: String
    var name: String
    var type: AnimalType
    var image: UIImage? = nil
    
    init(id: String, name: String, type: AnimalType, image: UIImage? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.image = image
    }
}
