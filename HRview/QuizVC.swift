//
//  QuizVC.swift
//  HomeRoomApp
//
//  Created by Daniel Ramirez on 12/2/16.
//  Copyright © 2016 simpleCoding. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
