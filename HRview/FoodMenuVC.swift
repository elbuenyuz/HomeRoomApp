//sections menu


import UIKit
import Foundation
import Firebase


class FoodMenuVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let menuRef = DataService.ds.REF_MENU_SECTIONS
    
    
    var menu = [ItemMenu]()
    
    //tableView Obj
    @IBOutlet weak var specialsOrMenuLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //backBtn
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //we observe if any value change we actualized the information ASAP
       DataService.ds.REF_MENU_SECTIONS.observe(.value, with: {(snapshot) in
            self.menu = [ItemMenu] ()
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot{
                    if let dict = snap.value as? Dictionary<String,AnyObject>{
                        let name =  dict["name"] as? String
                        let imgPath = dict["imgPath"] as? String
                        let img = UIImage(named:imgPath!)
                        print("\(name),\(img)")
                        
                        let mac = ItemMenu(name: name!, img: img!)
                        self.menu.append(mac)
                        print("sale")
                    }
                }
                
            }
        
            self.menuRef.keepSynced(true)
            self.tableView.reloadData()
        })
        
       
        tableView.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //detect when selected
        if let cell = tableView.cellForRow(at: indexPath){
            
            let mac = menu[cell.tag]
            print("\(mac.name)")
            switch mac.name {
            case "Mac & Cheese":
                print("show information about Macs.")
                sendReference(ref: DataService.ds.REF_MACS)
                
                break
            case "Desserts":
                print("show information about Desserts")
                sendReference(ref: DataService.ds.REF_DESSERTS)

                break
            case "Specials":
                print("show information about specials")
                sendReference(ref: DataService.ds.REF_SPECIALS)

                break
            case "Drinks":
                print("show information about drinks")
                

                break
            case "Side & Salads":
                print("show information about sides & salads")
                sendReference(ref: DataService.ds.REF_SIDE_SALADS)

                break
            default:
                break
            }
            
            
        }
        
    }
    
    func sendReference(ref: FIRDatabaseReference){
        performSegue(withIdentifier: "detailMenu", sender: ref)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menu.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as? MenuCell{
            print("cell")
            let mac = menu[indexPath.row]
            let name = mac.name
            let img = mac.img
            print("\(name),\(img)")
            cell.confCell(img, named: name)
            cell.tag = indexPath.row
            
            return cell
        }else{
            
            return UITableViewCell()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MenuDetailVC{
            if let ref = sender as? FIRDatabaseReference{
                
                destination.reference = ref
            }
        }
    }
}
