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
    @IBOutlet weak var ingredientsLbl: UILabel!
    @IBOutlet weak var pairLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var likesLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
       
        
        // Configure the view for the selected state
    }
    
    func confCell(_ img:UIImage,named:String,ingredients: String,price:String,pair:String,likes:String){
        
        likesLbl.text = likes
        priceLbl.text = price
        ingredientsLbl.text = ingredients
        pairLbl.text = pair
        nameLbl.text = named
        imageLbl.image = img
        
        
    }
}
