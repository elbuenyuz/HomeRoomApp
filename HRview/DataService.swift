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

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    //servicio de informacion
    static let ds = DataService()
    
    //creamos la referencia a la url
    fileprivate var _REF_BASE = DB_BASE
    fileprivate var _REF_MACS = DB_BASE.child("macs")
    fileprivate var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference{
        return _REF_BASE
    }
    
    var REF_MACS:FIRDatabaseReference{
        return _REF_MACS
    }
    
    var REF_USERS:FIRDatabaseReference{
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String,userData:Dictionary<String,String>){
        REF_USERS.child(uid).updateChildValues(userData)
        
        
    }
}
