//
//  LoginVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 11/29/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//


import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit

class LoginVC: UIViewController {
    
    

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = UserDefaults.standard.value(forKey: KEY_UID){
            print("INFO : key user found")
            performSegue(withIdentifier: "goNext", sender: nil)
        }
    }
    
    @IBAction func loginFbBtnPressed(_ sender: Any) {
        print("INFOLOG: entra fbBtn")
        //create login
        let faceLogin = FBSDKLoginManager()
        
        //login with read permission
        faceLogin.logIn(withReadPermissions: ["email"], from: self){ (result,faceError) in
            
            if faceError != nil{
                print("ERROR: faceError.debugDescription")
                
            }else if result?.isCancelled == true{
                print("ERROR: the auth with facebook was cancelled")
                
            }else{
                print("sin error entra")
                //make conexion and save user in firebase
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        //email and pwd diferent ""
        if let email = emailField.text, email != "", let pwd = passwordField.text, pwd != ""{
            //if email and pwd exist we signin
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd) { (user, error) in
                //if error
                if error != nil{
                    //handleling specific errors
                    if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                        
                        switch errCode {
                        case .errorCodeInvalidEmail:
                            self.showErrorAlert("Invalid Email", msg:"please check your email and try again.")
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
                    //email log in success
                    if let user = user{
                        let userData = ["provider":user.providerID]
                        self.completeSignInWithName(id: user.uid,userData: userData)
                    }
                }
            }
        }
    }
    //prepareSegue
    
    //func showe alert pop up
    func showErrorAlert(_ title: String, msg: String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    //firebase Auth
    func firebaseAuth(_ credential:FIRAuthCredential){
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil{
                print("info: Unable to auth with Firebase\(error.debugDescription)")
                
            }else{
                print("info: succesfully auth with firebase")
                if let user = user{
                    
                    let userData = ["provider":credential.provider]
                    
                    
                    self.completeSignInWithName(id: user.uid,userData: userData)
                }
            }
        })
    }
    //signin with uid and name
    func completeSignInWithName(id: String,userData: Dictionary<String,String>){
        
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        UserDefaults.standard.setValue(id, forKey: KEY_UID)
        print("INFO: data save to lcoal memory ")
        performSegue(withIdentifier: "goNext", sender: nil)

    }
    
}







