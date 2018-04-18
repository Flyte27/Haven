//
//  References.swift
//  Haven
//
//  Created by Alex Payne on 2018-04-17.
//  Copyright © 2018 Alex Payne. All rights reserved.
//

import Foundation
/*
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
 
 
 
 @IBOutlet weak var tableView: UITableView!
 
 var displayedAnimals = [Animal]()
 
 override func viewDidLoad() {
 
 refreshAnimals()
 
 tableView.estimatedRowHeight = 50
 tableView.rowHeight = UITableViewAutomaticDimension
 
 tableView.delegate = self
 tableView.dataSource = self
 
 refreshAnimals()
 
 NotificationCenter.on(.refreshAnimals, observer: self, selector: #selector(refreshAnimals))
 }
 
 func refreshAnimals() {
 displayedAnimals = AnimalsHelper.getAnimalsOf(type: .dog)
 tableView.reloadData()
 }
 }
 extension AnimalListController: UITableViewDelegate, UITableViewDataSource {
 func numberOfSections(in tableView: UITableView) -> Int {
 return 1
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return displayedAnimals.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeue(AnimalBasicCell.self)
 cell.populate(animal: displayedAnimals[indexPath.row])
 return cell
 }
 
 func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 return true
 }
 
 func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
 let adoptAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Adopt") { (action, indexPath) -> Void in
 FirebaseGeneral.removeDog(id: self.displayedAnimals[indexPath.row].id)
 }
 adoptAction.backgroundColor = UIColor.main
 
 return [adoptAction]
 }
 
 
 
 
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
 
 
*/
