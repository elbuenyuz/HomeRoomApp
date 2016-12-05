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
    
    private var _name: String
    var name:String{
        _name = self.name
        return _name
    }
    
    private var _type: String
    var type:String{
        _type = self.type
        return _type
    }
    
    private var _ingredients: String
    var ingredients:String{
        _ingredients = self.ingredients
        return _ingredients
    }
    
    private var _imgPath: String
    var imgPath:String{
        _imgPath = self.imgPath
        return _imgPath
        
    }
    
    private var _favorite: Bool
    var favorites:Bool{
        _favorite = self.favorites
        return _favorite
    }
    
    private var _glutenFreeFriendly: Bool
    var glutenFreeFriendly: Bool{
        _glutenFreeFriendly = self.glutenFreeFriendly
        return _glutenFreeFriendly
    }
    
    private var _price: Double
    var price:Double{
        
        _price = self.price
        return _price
    }
    
    private var _description: String
    var description:String{
        _description = self.description
        return _description
    }
    
    init(name:String,type:String,ingredients:String,imgPath:String,favorites:Bool,glutenFriendly:Bool,price:Double,description:String) {
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
