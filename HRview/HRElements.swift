//
//  File.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/2/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import Foundation
import UIKit

class HRElements{
    
    fileprivate var _name: String
    var name:String{
        return _name
    }
    
    fileprivate var _type: String
    var type:String{
        return _type
    }
    
    fileprivate var _ingredients: String
    var ingredients:String{
        return _ingredients
    }
    
    fileprivate var _imgPath: UIImage
    var imgPath:UIImage{
        return _imgPath
        
    }
    
    fileprivate var _favorite: Bool
    var favorites:Bool{
        return _favorite
    }
    
    fileprivate var _glutenFreeFriendly: Bool
    var glutenFreeFriendly: Bool{
        return _glutenFreeFriendly
    }
    
    fileprivate var _price: Double
    var price:Double{
        return _price
    }
    
    fileprivate var _description: String
    var description:String{
        return _description
    }
    
    init(name:String,type:String,ingredients:String,imgPath:UIImage,favorites:Bool,glutenFriendly:Bool,price:Double,description:String) {
        self._name = name
        self._ingredients = ingredients
        self._type = type
        self._imgPath = imgPath
        self._favorite = favorites
        self._glutenFreeFriendly = glutenFriendly
        self._price = price
        self._description = description
        
        
        
    }
    
}
