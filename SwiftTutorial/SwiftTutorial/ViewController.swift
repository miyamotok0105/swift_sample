//
//  ViewController.swift
//  SwiftTutorial
//
//  Created by USER on 2018/01/22.
//  Copyright © 2018年 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ch01()
        ch02()
        ch03()
        
    }

    func ch01() {
        //変数
        var i = 1
        var it : Int = 1
        //定数
        let t = 1
        
        //演算
        i += 1
        it += 1
        print(i+it)
        print(t)
    }
    
    func ch02() {
        var x = 300
        if x > 100 {
            print("……条件が正しい時の処理……")
        } else {
            print("……正しくない時の処理……")
        }
        
        switch x {
        case 0:
            print("zero")
        case 1...9:
            print("１桁")
        case 10...99:
            print("２桁")
        case 100...999:
            print("３桁")
        default:
            print("いっぱい")
        }
        
        for i in 1...9 {
            print(i)
        }
        
        var count = 0
        var total = 0
        while count < 10 {
            count += 1
            total += count
        }
        print(total)
        
        
        
    }
    
    func ch03() {
        func calc(num:Int) -> Int {
            var total:Int = 0
            for i in 1...num {
                total += i
            }
            return total
        }
        
        calc(num: 100)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

