//
//  ViewController.swift
//  obc2swiftGUI
//
//  Created by USER on 2017/11/17.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("load!!!")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tappedButton(_ sender: Any) {
        let actor = Actor()
        actor.buttonTapped()
    }
    
}

