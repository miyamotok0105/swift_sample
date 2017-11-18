//
//  ModalViewController.swift
//  mixi-IOS-Training
//
//  Created by USER on 2017/11/18.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class BaseModalViewController: UIViewController {
    
    let modalVC = ModalViewController(nibName: "ModalViewController", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BaseModalViewController load")
        
        view.addSubview(modalVC.view)
        modalVC.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [.top, .left, .right, .bottom].map {
            NSLayoutConstraint(item: modalVC.view, attribute: $0, relatedBy: .equal, toItem: view, attribute: $0, multiplier: 1, constant: 0)
        }
        view.addConstraints(constraints)
        addChildViewController(modalVC)
        //didMoveはsceneの初期設定をさせる定番メソッド。ViewControllerのviewDidLoadのようなもの。
        modalVC.didMove(toParentViewController: self)
        
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
