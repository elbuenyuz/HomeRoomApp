
//
//  MainVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 11/30/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit

class FoodMenuVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var numberToDisplay = 0
    var arrayImg: [UIImage] = []
    
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
        
            
        //charged the image in to the array
        for x in 0...4{
            
            let imagePath = UIImage(named: "hr\(x).jpg")!
            
            arrayImg.append(imagePath)
            
        }
        
        tableView.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
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
            print("\(arrayImg.count) array , and \(ARRAY_MENU_NAMES.count)" )
            return cell
        }else{
            
            return UITableViewCell()
        }
        
    }
    
}
