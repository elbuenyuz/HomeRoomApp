//
//  CreateAccountVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/5/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit
import Firebase
class CreateAccountVC: UIViewController {
   
    @IBOutlet weak var usernameField: StyleTextField!
    @IBOutlet weak var emailField: StyleTextField!
    @IBOutlet weak var pwdField: StyleTextField!
    @IBOutlet weak var rePwdField: StyleTextField!
    @IBOutlet weak var infoLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = UserDefaults.standard.value(forKey: KEY_UID){
            print("INFO : key user found")
            performSegue(withIdentifier: "goNext", sender: nil)
        }
    }
    //backBtnPressed
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        //check all the texfields requirements
        if let name = usernameField.text, name != "", let email = emailField.text,email != "",let pwd = pwdField.text, pwd != "", let rePwd = rePwdField.text, rePwd == pwd{
            
            //create a new account user
            FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                
                if error != nil{
                    //handleling specific errors
                    if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                        
                        switch errCode {
                        case .errorCodeInvalidEmail:
                            self.infoLabel.text = "Invalid email, this mail is Invalid."
                            print("invalid email")
                        case .errorCodeEmailAlreadyInUse:
                            self.infoLabel.text = "Invalid email, this mail is already used."
                            print("in use")
                        case .errorCodeUserNotFound:
                           self.infoLabel.text = "User not found, if is your first time, create an account or use the facebook login"
                            print("user not found")
                        case .errorCodeNetworkError:
                           // self.infoLabel.text = "Network error, try again in a second."
                            print("network error")
                        case .errorCodeWrongPassword:
                            self.infoLabel.text = "Wrong password, please make sure is correct."
                            print("wrong password")
                            
                        default:
                            print("Create User Error: \(error)")
                        }
                    }
                    
                }else{
                    if let user = user{
                        print("INFO: user created and login success")
                        let userData = ["provider":user.providerID]
                        self.completeSignInWithName(id: user.uid, userData: userData)
                    }
                }
            })
        }else{
            print("The passwords that you enter doesn't match.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MainMenuVC{
            if let userName = sender as? String{                
              
            }
        }
    }
    func completeSignInWithName(id: String, userData: Dictionary<String,String>){
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        UserDefaults.standard.setValue(id, forKey: KEY_UID)
        performSegue(withIdentifier: "goNext", sender: nil)
    }
}







