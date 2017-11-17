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
        
        let actorObc = ActorObc()
        actorObc.tappedButton()
        
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/2 - bHeight/2
        let label: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.textColor = UIColor.white
        label.text = "ViewController screen!!"
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(label)
        
        let badgeView = BadgeView()
        self.view.addSubview(badgeView)
        
//        self.view.addSubview(label)
//        actorObc.
//        actorObc.initLabel1()
        
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

