//
//  UIStoryboard+Helpers.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

struct Storyboard {
    
    static let main = "Main"
}

extension UIStoryboard {
    
    class var main: UIStoryboard {
        return UIStoryboard(name: Storyboard.main, bundle: nil)
    }
    
    func controllerWithID(_ id: StoryboardID) -> UIViewController {
        return self.instantiateViewController(withIdentifier: id.rawValue)
    }
}

enum StoryboardID: String {
    
    case tabBarViewController
    
    var name: String {
        return self.rawValue
    }
}
