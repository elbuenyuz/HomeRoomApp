//
//  FeedbackVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/2/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase

class FeedbackVC: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{

    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textViewLabel: UITextView!
    @IBOutlet weak var messageLbl: UITextView!
    var reference:FIRDatabaseReference = DataService.ds.REF_FEEDBACK
    var pickerData = PICKERDATA_FEEDBACK
    var selectedType:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedType = 0
        pickerView.dataSource = self
        pickerView.delegate = self
        // Do any additional setup after loading the view.
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func bckBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // if is selected..
        messageLbl.text = pickerData[row]
        selectedType = row
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    //try to send information
    @IBAction func snedBtnPressed(_ sender: Any) {
        
    }
    
    
}
