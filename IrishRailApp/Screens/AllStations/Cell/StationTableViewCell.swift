//
//  StationTableViewCell.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell, Identifiable, ReusableView {

    @IBOutlet private weak var labelDirection: UILabel!
    @IBOutlet private weak var labelDiscription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(withDirection: String, withCode: String, withLatitude: String, withLongitude: String) {
        self.labelDirection.text = withDirection
        self.labelDiscription.text = withCode + "\n" + "Latitude: \(withLatitude)" + "\n"  + "Longitude: \(withLongitude)"
    }
}
