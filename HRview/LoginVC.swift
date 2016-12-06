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
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        //email and pwd diferent ""
        if let email = emailField.text, email != "", let pwd = passwordField.text, pwd != "",let username = usernameField.text, username != ""{
            //if email and pwd exist we signin
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd) { (user, error) in
                //if error
                if error != nil{
                    //handleling specific errors
                    if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                        
                        switch errCode {
                        case .errorCodeInvalidEmail:
                            self.showErrorAlert(title: "Invalid Email", msg:"please check your email and try again.")
                            print("invalid email")
                        case .errorCodeEmailAlreadyInUse:
                            self.infoLabel.text = "Invalid email, this mail is already used."
                            print("in use")
                        case .errorCodeUserNotFound:
                            self.infoLabel.text = "User not found, if is your first time, create an account or use the facebook login"
                            print("user not found")
                        case .errorCodeNetworkError:
                            self.infoLabel.text = "Network error, try again in a second."
                            print("network error")
                        case .errorCodeWrongPassword:
                            self.infoLabel.text = "Wrong password, please make sure is correct."
                            print("wrong password")
                        default:
                            print("Create User Error: \(error)")
                        }    
                    }
                    
                }else{
                    //if an error doesn't exist
                    //local memory we saved the user uid
                    UserDefaults.standard.setValue(user?.uid,forKey:KEY_UID)
                    UserDefaults.standard.setValue(username, forKey: KEY_USERNAME)
                    //SignInWithEmail
                    FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: nil)
                    
                    print("name of user: \(username)")
                    self.performSegue(withIdentifier: "goNext", sender: username)
                    
                    
                    
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MainMenuVC{
            if let userName = sender as? String{
                destination.usernameTitle = userName
            }
        }
    }
    //func showe alert pop up
    func showErrorAlert(title: String, msg: String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}
