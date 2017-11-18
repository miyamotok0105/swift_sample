//
//  ModalViewController.swift
//  mixi-IOS-Training
//
//  Created by USER on 2017/11/18.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressButton(_ sender: Any) {
        let viewControlelr = ChildViewController(nibName: "ChildViewController", bundle: nil)
        viewControlelr.delegate = self // [5] delegate 先として自身を代入
        present(viewControlelr, animated: true, completion: nil)
        
    }
}

extension ModalViewController: ChildViewControllerDelegate { // [4] protocol の採用
    func childViewController(_ viewController: ChildViewController, didPressCloseButton button: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
