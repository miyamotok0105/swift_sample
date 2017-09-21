//
//  ViewController.swift
//  UikitSample
//
//  Created by USER on 2017/09/16.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit


//final class NavigationViewController: UINavigationController {
//    override func viewDidLoad() { super.viewDidLoad() }
//}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "first"
        self.addLabel1()
        self.addButton1()
        self.addButton2()
        self.addButton3()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func addLabel1() {
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/10 - bHeight/10
        let label: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.textColor = UIColor.white
        label.text = "Hello Swift!!"
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(label)
    }
    
    func addButton1() {
        var myButton: UIButton!
        myButton = UIButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/5 - bHeight/5
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("ナビゲーションビューへ", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.setTitle("GO!!!", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        myButton.tag = 1
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    func addButton2() {
        var myButton: UIButton!
        myButton = UIButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/3 - bHeight/3
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("コレクションビューへ", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.setTitle("GO!!!", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        myButton.tag = 2
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    func addButton3() {
        var myButton: UIButton!
        myButton = UIButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/2 - bHeight/2
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("へ", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.setTitle("GO!!!", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        myButton.tag = 3
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    internal func onClickMyButton(sender: UIButton) {
        print("onClickMyButton:");
        print("sender.currentTitle: \(sender.currentTitle!)")
        print("sender.tag: \(sender.tag)")
        
        
        if sender.tag == 1 {
            let viewController3 = ViewController3()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(viewController3, animated: true)
            self.hidesBottomBarWhenPushed = false
        } else if sender.tag == 2 {
            let viewController4 = ViewController4()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(viewController4, animated: true)
            self.hidesBottomBarWhenPushed = false
        } else if sender.tag == 3 {
            let viewController5 = ViewController5()
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(viewController5, animated: true)
            self.hidesBottomBarWhenPushed = false
        }

        
    }
    
}

