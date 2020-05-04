//
//  UIViewController+Extenstions.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showActionsheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
       let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
       for (index, (title, style)) in actions.enumerated() {
           let alertAction = UIAlertAction(title: title, style: style) { (_) in
               completion(index)
           }
           alertViewController.addAction(alertAction)
        }
        viewController.present(alertViewController, animated: true, completion: nil)
       }
}
