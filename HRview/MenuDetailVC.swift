//
//  Detailmenu
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/2/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit



class MenuDetailVC:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!

    var numberToDisplay:Int!
    
    fileprivate var _arrayElements = [HRElements]()
    
    var arrayElements:[HRElements]{
        get{
            return _arrayElements
        }
        set{
            _arrayElements = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        //detect when selected
//        if let cell = tableView.cellForRow(at: indexPath){
//            
//            switch cell.tag {
//            case 0:
//                self.performSegue(withIdentifier: "ToDetailMenu", sender: arrayMacs)
//            case 1:
//                print("sides")
//            case 2:
//                print("specials")
//            case 3:
//                print("desserts")
//            case 4:
//                print("Drinks")
//            case 5:
//                print("togo")
//                
//            default:
//                break
//            }
//            
//            
//        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayElements.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailMenu") as? MenuDetailCell{
            let newItem = arrayElements[indexPath.row]
            cell.confCell(newItem.imgPath, named: newItem.name)
            cell.tag = indexPath.row
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
