//
//  MenuCell.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 11/30/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var labelMenu: UILabel!
    @IBOutlet weak var imgMenu: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
            
            layer.cornerRadius = 4.0
            layer.shadowColor = UIColor(red:SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).cgColor
            layer.shadowRadius = 5.0
            layer.shadowOpacity = 0.8
            layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func confCell(img:UIImage,named:String){
        
        labelMenu.text = named
        imgMenu.image = img

        
    }

}
