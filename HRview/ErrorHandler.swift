//
//  ErrorHandler.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/7/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import Foundation
import UIKit

//need to make it work
class ErrorHandler:UIViewController{
    
    func showErrorAlert(_ title: String, msg: String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

}
