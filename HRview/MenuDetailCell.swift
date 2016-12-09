//
//  MenuDetailCell.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/7/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit

class MenuDetailCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imageLbl: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func confCell(_ img:UIImage,named:String){
        
        nameLbl.text = named
        imageLbl.image = img
        
        
    }
}
