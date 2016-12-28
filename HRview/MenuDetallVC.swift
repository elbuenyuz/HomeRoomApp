//  Detailmenu
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/2/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//
import UIKit
import Firebase


class MenuDetailVC:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var reference: FIRDatabaseReference = DataService.ds.REF_BASE
    var numberToDisplay:Int!

    var menu = [Macs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //charge the macs img and name
        reference.observe(.value, with: {(snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot{
                    if let dict = snap.value as? Dictionary<String,AnyObject>{
                        
                        let name =  dict["name"] as? String
                        let imgPath = dict["imgPath"] as? String
                        let img = UIImage(named:imgPath!)
                        let price = dict["price"] as? String
                        let pair = dict["pair"] as? String
                        let ingredients = dict["ingredients"] as? String
                        
                        print("\(name),\(img)")
                        let mac = Macs(name: name!, img:img!, ingredients:ingredients!, price:price!, likes:"100", pair:pair!)
                        
                        self.menu.append(mac)
                    }
                }
            }
            self.reference.keepSynced(true)//amazing refreshing the info
            self.tableView.reloadData()
        })
        
        
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
        
                
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as? MenuDetailCell{
            print("cell")
            let item = menu[indexPath.row]
            let name = item.name
            let img = item.img
            let price = item.price
            let ingredients = item.ingredients
            let likes = item.likes
            let pair = item.pair
            print("\(name),\(img)")
            
            cell.confCell(img, named: name, ingredients: ingredients, price: price, pair: pair, likes: likes)
            cell.tag = indexPath.row
            
            return cell
        }else{
            
            return UITableViewCell()
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
