//
//  Extensions.swift
//  Haven
//
//  Created by Alex Payne on 2017-07-24.
//  Copyright © 2017 Alex Payne. All rights reserved.
//

import UIKit

extension UIColor {
    static let main: UIColor = UIColor(red: 0.4, green: 0.6, blue: 0.8, alpha: 1.0)
}

extension UINavigationBar {
    func defaultColors() {
        self.tintColor = UIColor.white
        self.barTintColor = UIColor.main
        self.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.isTranslucent = false
    }
}

extension UIStoryboard {
    convenience init(_ name: String) {
        self.init(name: name, bundle: nil)
    }
    func instantiate<T: UIViewController>(_ type: T.Type) -> T {
        return self.instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}

extension UINib {
    convenience init(_ nibName: String) {
        self.init(nibName: nibName, bundle: nil)
    }
}

extension UITableView {
    
    func registerNib<T: UITableViewCell>(_ type: T.Type) {
        registerNib(String(describing: type))
    }
    func registerNib(_ type: String) {
        register(UINib(type), forCellReuseIdentifier: type)
    }
    
    func dequeue<T: UITableViewCell>(_ type: T.Type) -> T {
        return dequeue(String(describing: type)) as! T
    }
    func dequeue(_ type: String) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: type)
    }
}

extension String {
    static func getCutenessString() -> String {
        let CUTENESS_LEVEL_STRINGS = ["Totally", "Very", "Completely", "Undeniably", "Especially", "Unquestionably", "Genuinely", "Truly", "Veritably", "Undoubtably", "Extremely", "Strikingly", "Excessively", "Immensely", "Intensely", "Too", "Quite", "Remarkably", "Incredibly", "Unusually", "Wonderfully", "Exceedingly", "Deeply"]
        let randomInt = Int(arc4random_uniform(UInt32(CUTENESS_LEVEL_STRINGS.count)))
        return CUTENESS_LEVEL_STRINGS[randomInt] + " Cute"
    }
}

extension NSNotification.Name {
    static let refreshAnimals = NSNotification.Name("refreshAnimals")
}

extension NotificationCenter {
    
    enum Notifications: String {
        case refreshAnimals
    }
    
    static func post(name: NSNotification.Name, object: [String: AnyObject]? = nil, userInfo: [String: AnyObject]? = nil) {
        NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
    }
    
    static func on(_ name: NSNotification.Name, object: [String: AnyObject]? = nil, observer: AnyObject, selector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
}
