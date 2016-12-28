//
//  File.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/2/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import Foundation
import UIKit

class Macs{
    
    private var _NAME: String
    private var _IMG: UIImage
    private var _INGREDIENTS: String
    private var _PRICE: String
    private var _LIKES:String
    private var _PAIR: String
    
    var name: String{
        return _NAME
    }
    var img: UIImage{
        return _IMG
    }
    var ingredients:String{
        return _INGREDIENTS
    }
    var price:String{
        return _PRICE
    }
    var likes:String{
        return _LIKES
    }
    var pair:String{
        return _PAIR
    }
    
    
    init(name: String, img: UIImage,ingredients: String,price:String,likes:String,pair:String){
        
        self._PAIR = pair
        self._INGREDIENTS = ingredients
        self._LIKES = likes
        self._PRICE = price
        self._NAME = name
        self._IMG = img
    }
    
    
}
