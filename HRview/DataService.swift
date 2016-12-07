//
//  DataService.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/6/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

let URL_BASE = "homeroom510.firebaseio.com"

class DataService {
    //servicio de informacion
    static let ds = DataService()
    
    //creamos la referencia a la url
    fileprivate var _REF_BASE = FIRDatabase.database().reference(fromURL: URL_BASE)
    
}
