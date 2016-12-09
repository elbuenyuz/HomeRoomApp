//
//  MainMenuVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/1/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//


import AVFoundation
import UIKit
import MapKit

class MainMenuVC:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var welcomeUserName: UILabel!
    
    fileprivate var _usernameTitle:String = ""
    var arrayImg = [UIImage]()
    private var BASEMACS = [HRElements]()
    
    var popUpInfo = ErrorHandler()
    
    var usernameTitle:String{
        get{
            return _usernameTitle
        }
        set{
            _usernameTitle = newValue
        }
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //call the name of the user
        welcomeUserName.text = "Welcome \(usernameTitle)"
        
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
        
        //create image array
        for x in ARRAY_NAMES_MENU{
            
            if let imgPath = UIImage(named: "\(x).png"){
                
                //append to array
                arrayImg.append(imgPath)
            }
        }
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //did Selected
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayImg.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? MainMenuCell{
            
            
            cell.confCell(arrayImg[indexPath.row], lbNAme: ARRAY_NAMES_MENU[indexPath.row] ,index:indexPath)
            
            return cell
        }else{
            return UICollectionViewCell()
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 10, height: 10)
        
    }

    
    @IBAction func ifBtnPressed(_ sender: AnyObject) {
        
        if let condition = sender.tag{
            
            switch condition {
            case 0:
                performSegue(withIdentifier: "macs", sender: nil)
            case 1:
                //specials macs
                performSegue(withIdentifier: "macs", sender: nil)
            case 2:
                performSegue(withIdentifier: "feedback", sender: nil)
            case 3:
                performSegue(withIdentifier: "contact", sender: nil)
            case 4:
                performSegue(withIdentifier: "quiz", sender: nil)
            case 5:
                performSegue(withIdentifier: "aboutus", sender: nil)
            default:
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //especific actiopn for segue.
        
    }
}




