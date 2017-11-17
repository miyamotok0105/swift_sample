//
//  PostViewController.swift
//  mixi-IOS-Training
//
//  Created by USER on 2017/11/18.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
//    protocol ChildViewControllerDelegate: class { // [1] プロトコルの宣言
//        func childViewController(_ viewController: PostViewController, didTapCloseButton button: UIButton)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
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
