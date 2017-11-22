//
//  ViewController.swift
//  UikitStoryboardSample
//
//  Created by USER on 2017/11/23.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btn2Tapped(_ sender: Any) {
        print("tapped")
        performSegue(withIdentifier: "screenTransition", sender: self)
    }
    
    @IBAction func btn3Tapped(_ sender: Any) {
        print("tapped")
        let next: UIViewController = storyboard!.instantiateViewController(withIdentifier: "ViewController2")
        present(next, animated: true, completion: nil)
        
    }
    
    @IBAction func btn4Tapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Another", bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as UIViewController!
        present(next, animated: true, completion: nil)
    }
    
}

