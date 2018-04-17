//
//  AnimalsHelper.swift
//  Haven
//
//  Created by Alex Payne on 2018-04-17.
//  Copyright © 2018 Alex Payne. All rights reserved.
//

import UIKit

class AnimalsHelper {
    
    static var animals = [String: Animal]()
    
    static func getAnimalsOf(type: AnimalType) -> [Animal] {
        var targetAnimals = [Animal]()
        for animal in animals.values {
            if animal.type == type {
                targetAnimals.append(animal)
            }
        }
        return targetAnimals
    }
}
