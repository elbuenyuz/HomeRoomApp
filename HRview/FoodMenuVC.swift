
//
//  MainVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 11/30/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit
import Foundation

class FoodMenuVC: UIViewController,UITableViewDataSource,UITableViewDelegate{

    
    var numberToDisplay = 0
    var arrayImg: [UIImage] = []
    
    var arrayMacs : [HRElements] = []
    
    
    //tableView Obj
    @IBOutlet weak var specialsOrMenuLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        arrayImg = [UIImage]()
        //functions later
        //charged the image in to the array
        for x in ARRAY_MENU_NAMES{
            
            let imagePath = UIImage(named: "\(x).jpg")!
            
            arrayImg.append(imagePath)
            
        }
        //charged the image in to the array
        for x in ARRAY_MACS{
            
            if let imagePath = UIImage(named: "\(x).jpg"){
                
                let mac = HRElements(name: x, type: "mac", ingredients: "cheese", imgPath: imagePath, favorites: true, glutenFriendly: true, price: 12.50, description: "no description for now")
                arrayMacs.append(mac)
                print(mac.name)
            }
        }
        
        
        
        tableView.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //detect when selected
        if let cell = tableView.cellForRow(at: indexPath){
            
            switch cell.tag {
            case 0:
                self.performSegue(withIdentifier: "ToDetailMenu", sender: arrayMacs)
            case 1:
                print("sides")
            case 2:
                print("specials")
            case 3:
                print("desserts")
            case 4:
                print("Drinks")
            case 5:
                print("togo")
            
            default:
                break
            }
            
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayImg.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("entra")
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as? MenuCell{
            cell.confCell(arrayImg[indexPath.row], named: ARRAY_MENU_NAMES[indexPath.row])
            cell.tag = indexPath.row
            print("\(arrayImg.count) array , and \(ARRAY_MENU_NAMES.count)" )
            return cell
        }else{
            
            return UITableViewCell()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MenuDetailVC{
            if let selectionArray = sender as? [HRElements]{
                destination.arrayElements = selectionArray
            }
        }
    }

}
