//
//  RequireVersion.swift
//  ForceUpdateManual
//
//  Created by USER on 2017/10/07.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit
import Foundation

public final class RequireVersionController: NSObject {
    /// The App's Singleton
    public static let shared = RequireVersionController()
    internal var updaterWindow: UIWindow?
    fileprivate let YOUR_APP_ID = "1275857066"
    
    func compareVersion() {
        let currentInstalledVersion: String! = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        let currentRequireVersion: String! = "1.5"
        if currentRequireVersion.compare(currentInstalledVersion, options: .numeric) == .orderedDescending {
            showAlert()
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "アップデートのお知らせ",message: "アプリの新規バージョンがご利用になれます。今すぐバージョンをアップデートしてください。", preferredStyle: UIAlertControllerStyle.alert)
        let updateAction = UIAlertAction(title: "アップデート", style: UIAlertActionStyle.default){ (action: UIAlertAction) in
            self.launchAppStore()
        }
        alertController.addAction(updateAction)
        alertController.show()
    }
    func launchAppStore() {
        let urlString = "itms-apps://itunes.apple.com/jp/app/id\(YOUR_APP_ID)?mt=8"
        if let url = URL(string: urlString) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:])
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}

