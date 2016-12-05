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
    var newItem = HRElements(name: "Volcano", type: "mac", ingredients: "havarti,caramelizedonion,chicken,brocoli,peas,breadcrumbs", imgPath: "volcano.jpg", favorites: true, glutenFriendly: true, price: 12.50, description: "try the new volcano is has the perfect amount of spicy and cheese!.")
    
    var arrayImg = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
        for x in 0...6{
            
            if let imgPath = UIImage(named: "\(x).png"){
                
                
                arrayImg.append(imgPath)
            }
        }
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayImg.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? MainMenuCell{
            
            
            cell.confCell(img: arrayImg[indexPath.row], lbNAme: ARRAY_NAMES_MENU[indexPath.row] ,index:indexPath)
            
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
    //func
    
    @IBAction func ifBtnPressed(_ sender: AnyObject) {
        
        if let condition = sender.tag{
            
            switch condition {
            case 0:
                performSegue(withIdentifier: "macs", sender: sender.tag)
            case 1:
                performSegue(withIdentifier: "macs", sender: sender.tag)
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
}




