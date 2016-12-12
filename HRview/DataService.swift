//
//  DataService.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/6/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//
import UIKit
import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()


class DataService {
    
    
    //servicio de informacion
    static let ds = DataService()
    
    //creamos la referencia a la url
    fileprivate var _REF_BASE = DB_BASE
    fileprivate var _REF_MACS = DB_BASE.child("macs")
    fileprivate var _REF_USERS = DB_BASE.child("users")
    fileprivate var _REF_FEEDBACK = DB_BASE.child("feedbacks")
    fileprivate var _REF_SIDES_SALADS = DB_BASE.child("salads")
    fileprivate var _REF_DESSERTS = DB_BASE.child("desserts")
    
    //reference to image path
    
    
    var REF_BASE: FIRDatabaseReference{
        return _REF_BASE
    }
    
    var REF_MACS:FIRDatabaseReference{
        return _REF_MACS
    }
    
    var REF_USERS:FIRDatabaseReference{
        return _REF_USERS
    }
    var REF_FEEDBACK: FIRDatabaseReference{
        return _REF_FEEDBACK
    }
    var REF_SIDE_SALADS:FIRDatabaseReference{
        return _REF_SIDES_SALADS
    }
    var REF_DESSERTS: FIRDatabaseReference{
        return _REF_DESSERTS
    }
    func createFirebaseDBUser(uid: String,userData:Dictionary<String,String>){
        REF_DESSERTS.child(uid).updateChildValues(userData)
        
    }
    
    func createNewMac(id:String,macData: Dictionary<String,String>){   
        REF_DESSERTS.child(id).updateChildValues(macData)
        
    }
}
