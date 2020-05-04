//
//  UITableView+Extensions.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String { return String(describing: Self.self) }
}

protocol NibNameRepresentable {
    static var nibName: String { get }
}

extension NibNameRepresentable {
    static var nibName: String { return String(describing: Self.self) }
    static var nib: UINib { return UINib(nibName: Self.nibName, bundle: nil) }
}

extension UIView {
    
    class func fromNib<T>() -> T where T: UIView, T: NibNameRepresentable {
        guard let view = Bundle.main.loadNibNamed(T.nibName, owner: self, options: nil)?.first as? T else { fatalError("No \(T.nibName) available") }
        return view
    }
}

protocol ReusableView: Identifiable, NibNameRepresentable {}

extension UITableView {
    
    func registerCell<T: UITableViewCell >(_ cellType: T.Type) {
        let name = String(describing: cellType)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    func registerCells<T: UITableViewCell>(_ cellTypes: [T.Type]) {
        for cellType in cellTypes {
            let name = String(describing: cellType)
            let nib = UINib(nibName: name, bundle: nil)
            self.register(nib, forCellReuseIdentifier: name)
        }
    }
    
    func registerHeader<T: UITableViewHeaderFooterView>(_ headerType: T.Type) {
        let name = String(describing: headerType)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    func dequeueCell<T: UITableViewCell>(_ cellType: T.Type) -> T {
        let name = String(describing: cellType)
        guard let cell = dequeueReusableCell(withIdentifier: name) as? T else {
            fatalError("Could not dequeue cell with identifier: \(name)")
        }
        return cell
    }
    
    func dequeueHeader<T: UITableViewHeaderFooterView>(_ headerType: T.Type) -> T {
        let name = String(describing: headerType)
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: name) as? T else {
            fatalError("Could not dequeue cell with identifier: \(name)")
        }
        return cell
    }
    
    // Default delay time = 0.5 seconds
    // Pass delay time interval, as a parameter argument
    func reloadDataAfterDelay(delayTime: TimeInterval) {
        self.perform(#selector(self.reloadData), with: nil, afterDelay: delayTime)
    }
}

