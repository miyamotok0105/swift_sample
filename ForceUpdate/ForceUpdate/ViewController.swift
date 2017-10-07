//
//  ViewController.swift
//  ForceUpdate
//
//  Created by USER on 2017/09/16.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit
import Siren

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    @IBAction func actionForceImmediately(_ sender: Any) {
        let siren = Siren.shared
        siren.forceLanguageLocalization = Siren.LanguageType.Japanese
        siren.alertType = .force
        siren.checkVersion(checkType: .immediately)
    }
    
    @IBAction func actionForceDaily(_ sender: Any) {
        let siren = Siren.shared
        siren.forceLanguageLocalization = Siren.LanguageType.Japanese
        siren.alertType = .force
        siren.checkVersion(checkType: .daily)
    }
    
    @IBAction func actionForceWeekly(_ sender: Any) {
        let siren = Siren.shared
        siren.forceLanguageLocalization = Siren.LanguageType.Japanese
        siren.alertType = .force
        siren.checkVersion(checkType: .weekly)
    }
    
    @IBAction func actionForceSkip(_ sender: Any) {
        let siren = Siren.shared
        siren.forceLanguageLocalization = Siren.LanguageType.Japanese
        siren.alertType = .skip
        siren.checkVersion(checkType: .immediately)
    }
    
    @IBAction func actionForceOption(_ sender: Any) {
        let siren = Siren.shared
        siren.forceLanguageLocalization = Siren.LanguageType.Japanese
        siren.alertType = .option
        siren.checkVersion(checkType: .immediately)
    }
    
    @IBAction func actionForceNone(_ sender: Any) {
        let siren = Siren.shared
        siren.forceLanguageLocalization = Siren.LanguageType.Japanese
        siren.alertType = .none
        siren.checkVersion(checkType: .immediately)
    }

}

