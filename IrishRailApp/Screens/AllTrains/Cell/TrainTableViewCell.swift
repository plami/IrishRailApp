//
//  TrainTableViewCell.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class TrainTableViewCell: UITableViewCell, Identifiable, ReusableView {

    @IBOutlet private weak var labelDirection: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureCell(withDirection: String, withDate: String, withMessage: String) {
        self.labelDirection.text = "Direction: \(withDirection)"
        self.labelDate.text = "Date of departure: \(withDate)"
        let strippedMessage = withMessage.replacingOccurrences(of: "\\n", with: "; ", options: .literal, range: nil)
        self.labelMessage.text = strippedMessage
    }
}
