//
//  21SecondViewController.swift
//  mixi-IOS-Training
//
//  Created by USER on 2017/11/19.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class SecondViewController21: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.viewWithTag(5)?.removeFromSuperview()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
