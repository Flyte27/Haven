//
//  TypeViewController.swift
//  Haven
//
//  Created by Alex Payne on 2017-07-24.
//  Copyright © 2017 Alex Payne. All rights reserved.
//

import UIKit

class TypeViewController: UIViewController {
    
    @IBOutlet var panelViews: [UIView]!
    var tapGestures = [UITapGestureRecognizer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.defaultColors()
        
        for panelView in panelViews {
            panelView.layer.borderColor = UIColor.main.cgColor
            panelView.layer.borderWidth = 1.0
            panelView.layer.cornerRadius = 5.0
            panelView.layer.masksToBounds = true
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewAnimalList))
            panelView.isUserInteractionEnabled = true
            panelView.addGestureRecognizer(tapGesture)
        }
        
        self.navigationItem.title = "Haven"
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func viewAnimalList() {
        let animalListVC = storyboard!.instantiate(AnimalListController.self)
        self.navigationController?.pushViewController(animalListVC, animated: true)
    }
}
