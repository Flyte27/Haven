//
//  AnimalListController.swift
//  Haven
//
//  Created by Alex Payne on 2018-04-17.
//  Copyright © 2018 Alex Payne. All rights reserved.
//

import UIKit

class AnimalListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var displayedAnimals = [Animal]()
    
    override func viewDidLoad() {
        
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
}
