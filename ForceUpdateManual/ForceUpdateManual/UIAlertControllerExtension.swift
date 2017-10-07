import UIKit
import Foundation

internal extension UIAlertController {
    
    func show() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = RequireVersionViewController()
        window.windowLevel = UIWindowLevelAlert + 1
        
        RequireVersionController.shared.updaterWindow = window
        
        window.makeKeyAndVisible()
        window.rootViewController!.present(self, animated: true, completion: nil)
        
    }
}

internal class RequireVersionViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return UIApplication.shared.statusBarStyle }
}

