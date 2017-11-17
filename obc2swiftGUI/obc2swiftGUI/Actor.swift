//
//  ViewController2.swift
//  obc2swiftGUI
//
//  Created by USER on 2017/11/17.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class Actor: ViewController {
//
//    @IBOutlet weak var label1: UILabel!
//    @IBOutlet weak var button: UIButton!
//
    
    let actorObc = ActorObc()
    
    
    func buttonTapped() {
//        label1.text = "tapped!!"
        
        print("tapped!")
        
        //ob-cのメソッドを呼ぶ。
        actorObc.tappedButton()
        
    }
}
