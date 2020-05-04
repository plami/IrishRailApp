//
//  MovementsTableViewCell.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 3.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class MovementsTableViewCell: UITableViewCell, Identifiable, ReusableView {

    @IBOutlet private weak var labelDestination: UILabel!
    @IBOutlet private weak var labelLocation: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelScheduledDeparture: UILabel!
    @IBOutlet private weak var labelScheduledArrival: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(withDestination: String, withDate: String, withLocation: String, withLocationCode: String, withDeparture: String, withArrival: String) {
        self.labelDestination.text = "Destination: \(withDestination)"
        self.labelLocation.text = "Location: \(withLocation), \(withLocationCode)"
        self.labelDate.text = "Date: \(withDate)"
        self.labelScheduledDeparture.text = "Expected departure: \(withDeparture)"
        self.labelScheduledArrival.text = "Expected arrival: \(withArrival)"
    }
}
