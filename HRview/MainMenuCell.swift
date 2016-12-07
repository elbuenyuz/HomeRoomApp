//
//  MainMenuCell.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/1/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit

class MainMenuCell: UICollectionViewCell {
   
    @IBOutlet weak var btnCell: UIButton!
    @IBOutlet weak var labelCell: UILabel!
 
    override func awakeFromNib() {
        
        
    }
    
    func confCell(_ img:UIImage,lbNAme:String,index:IndexPath){
        
        btnCell.setImage(img, for: UIControlState.normal)
        labelCell.text = lbNAme
        btnCell.tag = index.row
        print("tag \(btnCell.tag)")

       
        print("index.row \(index.row)")
    }
    
}
