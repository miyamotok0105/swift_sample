//
//  ViewController.swift
//  mixi-IOS-Training
//
//  Created by USER on 2017/11/18.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //#Swiftの基礎
    //まず始めに
    //Xcodeのソースコード上で型にカーソルをあわせてcommandを押しながらクリックするとAPIの宣言を見ることができます。
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiftBasics()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swiftBasics() {
        var a: Int = 1
        let b: Int = 2
        a = b
        print(a) // 2
//        b = a // Cannot assign to value: 'b' is a 'let' constant
        print(b)
        
        //符号付き整数
//        let maxValue1: Int   = Int.max
//        let minValue1: Int   = Int.min
//        let maxValue2: Int8  = Int8.max
//        let minValue2: Int8  = Int8.min
//        let maxValue3: Int16 = Int16.max
//        let minValue3: Int16 = Int16.min
//        let maxValue4: Int32 = Int32.max
//        let minValue4: Int32 = Int32.min
//        let maxValue5: Int64 = Int64.max
//        let minValue5: Int64 = Int64.min
        
        //こぉいうのはできない
//        let value: Int = Int64.max
        //変換すると良い
        let value: Int = Int(Int64.max)
        print(value)
        
        //符号なし整数
//        let maxValue1: UInt   = UInt.max
//        let minValue1: UInt   = UInt.min
//        let maxValue2: UInt8  = UInt8.max
//        let minValue2: UInt8  = UInt8.min
//        let maxValue3: UInt16 = UInt16.max
//        let minValue3: UInt16 = UInt16.min
//        let maxValue4: UInt32 = UInt32.max
//        let minValue4: UInt32 = UInt32.min
//        let maxValue5: UInt64 = UInt64.max
//        let minValue5: UInt64 = UInt64.min

        let value2: Int = Int(UInt.max)
        print(value2)
        
        //浮動小数点数
//        let value1_1: Float  = 12.34   //32bitの範囲で値を保持
//        let value1_2: Float  = -12.34  //32bitの範囲で値を保持
//        let value2_1: Double = 123.45  //64bitの範囲で値を保持
//        let value2_2: Double = -123.45 //64bitの範囲で値を保持
        let value3: Double = Double(Float(12.34))
        print(value3)
        
        //真偽値
        let value4: Bool = true
        print(value4)
        
        //型推論
        //完全に型を指定しなくても推定してくれる
        let value5 = 10
        print(value5)
        
        
        
        
        
        
    }
    
    func UIViewControllerCustomizationStoryboard() {
        //UIViewControllerの役割
//        1.コンテンツを表示させる
//        2.複数の UIViewController を管理するコンテナ
//        3.他のViewControllerと連携する Modal(1.4.1)
        
        //コンテンツを表示させる
        //1.xib
        //2.storyboard
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

