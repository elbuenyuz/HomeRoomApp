//
//  LoginVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 11/29/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//


import UIKit
import Firebase

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnPressed
        (_ sender: Any) {
        //email and pwd diferent ""
        if let email = emailField.text, email != "", let pwd = passwordField.text, pwd != ""{
            //if email and pwd exist we signin
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd) { (user, error) in
                //if error
                if error != nil{
                    if FIRAuthErrorCode.errorCodeUserNotFound.rawValue == 17011{
                        
                        
                        //we create a new user
                        FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (result, error) in
                            //if error we show error
                            if error != nil{
                                
                                print("failed creating new user:\(error.debugDescription)")
                                self.showErrorAlert(title: "Could not creat account", msg: "there was a problem creating the account please try later")
                            }else{
                                
                                //we save the info in local memory
                                UserDefaults.standard.set(result?.uid, forKey: KEY_UID)
                                
                                //SignInWithEmail we are sure this exist
                                FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: nil)
                                
                                //send next View
                                self.performSegue(withIdentifier: "goNext", sender: nil)
                                print("loggedIn :)")
                                
                            }
                            
                        })
                        print(error.debugDescription)
                    }
                    
                    //error num 2 
                    
                    //error num3
                    print(error.debugDescription)
                    
                }else{
                    //if an error doesn't exist
                    //local memory we saved the user uid
                    UserDefaults.standard.setValue(user?.uid,forKey:KEY_UID)
                    //SignInWithEmail
                    FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: nil)
                    self.performSegue(withIdentifier: "goNext", sender: nil)
                    
                }
            }
        }
    }
    
    //func showe alert
    func showErrorAlert(title: String, msg: String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}
