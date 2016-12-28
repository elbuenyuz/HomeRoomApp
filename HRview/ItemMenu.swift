//
//  ItemMenu.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/22/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import Foundation
import UIKit

class ItemMenu {
    
    private var _NAME: String
    private var _IMG: UIImage
    
    var name: String{
        return _NAME
    }
    var img: UIImage{
        return _IMG
    }

    init(name: String, img: UIImage){
        
        self._NAME = name
        self._IMG = img

    }
}
