//
//  ACRoundButton.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

@IBDesignable
open class ACRoundButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = self.borderColor.cgColor
    }

    @IBInspectable
    public var backgroundColorAC: UIColor = .white {
        didSet {
            self.backgroundColor = self.backgroundColorAC
        }
    }

    @IBInspectable
    public var borderColor: UIColor = UIColor.init(hex: Constants.Colors.main)! {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }

    @IBInspectable
    public var borderWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }

    @IBInspectable
    public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}

