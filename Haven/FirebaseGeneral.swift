//
//  FirebaseModel.swift
//  Haven
//
//  Created by Alex Payne on 2018-04-17.
//  Copyright © 2018 Alex Payne. All rights reserved.
//

import UIKit
import Firebase

class FirebaseGeneral {
    static var firebaseRef = Database.database().reference()
    static var firebase = Database.database()
    
    static func setupListeners() {
        animalsListener()
    }
    
    static func animalsListener() {
        let animalsRef = firebaseRef.child("animals/dogs")
        animalsRef.observe(.childAdded, with: { snapshot in
            if let snapVal = snapshot.value as? [String: AnyObject] {
                let animalID = snapshot.key
                let name = snapVal["name"] as? String ?? "Pupper"
                let animal = Animal(id: animalID, name: name, type: .dog, image: UIImage(named: animalID))
                AnimalsHelper.animals[animalID] = animal
            }
        })
        
        animalsRef.observe(.childRemoved, with: { snapshot in
            let animalID = snapshot.key
            AnimalsHelper.animals[animalID] = nil
            NotificationCenter.post(name: .refreshAnimals)
        })
    }
    
    static func removeDog(id: String) {
        let animalsRef = firebaseRef.child("animals/dogs/" + id)
        animalsRef.removeValue()
    }
}
