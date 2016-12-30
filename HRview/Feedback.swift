//
//  Feedback.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/28/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import Foundation

class Feedback{
    
    fileprivate var _name: String
    fileprivate var _email: String
    fileprivate var _message: String
    fileprivate var _type: String
    
    var name:String{
        return _name
    }
    var email:String{
        return _email
    }
    var message:String{
        return _message
    }
    var type:String{
        return _type
    }
    
    init(name:String,email:String,message:String,type:String) {
        self._name = name
        self._email = email
        self._message = message
        self._type = type
        
    }
}
