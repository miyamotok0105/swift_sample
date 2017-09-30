//
//  ViewController.swift
//  apiKit
//
//  Created by USER on 2017/09/30.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit
import Foundation
//import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func decodeJson(jsonString str: String) {
        
        let personalData: Data =  str.data(using: String.Encoding.utf8)!
        
        do {
            let json = try JSONSerialization.jsonObject(with: personalData, options: JSONSerialization.ReadingOptions.allowFragments) // JSONパース。optionsは型推論可(".allowFragmets"等)
            print("do")
            print(json)
        } catch {
            print("error")
            print(error) // パースに失敗したときにエラーを表示
        }
        
    }

    @IBAction func apiAccess(_ sender: Any) {
        
                let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)
                let url = URL(string: "https://itunes.apple.com/lookup?id=1187265767&country=JP")!
        
                let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                    if let data = data {
                        let str = String(data: data, encoding: .utf8)!
                        print(str)
                        self.decodeJson(jsonString: str)
                        
                    }
                }
                
                task.resume()
        
    }
}

