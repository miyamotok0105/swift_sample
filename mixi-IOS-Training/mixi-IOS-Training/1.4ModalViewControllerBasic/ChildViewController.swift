//
//  ChildViewController.swift
//  mixi-IOS-Training
//
//  Created by USER on 2017/11/18.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

//
protocol ChildViewControllerDelegate: class { // [1] プロトコルの宣言
    func childViewController(_ viewController: ChildViewController, didPressCloseButton button: UIButton)
}

class ChildViewController: UIViewController {

    weak var delegate: ChildViewControllerDelegate? // [2] delegate オブジェクト
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressClosedButton(_ sender: UIButton) {
        delegate?.childViewController(self, didPressCloseButton: sender)
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
