//
//  StyleButton.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 11/29/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit

class StyleButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red:SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).cgColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        self.tintColor = UIColor.white
    }
}
