import UIKit

//tabbarとnavigation
class InitTabBarController: UITabBarController {
    
    
    func initTabBar() -> UITabBarController {
        let firstViewController = ViewController()
        let secondViewController = ViewController2()
        let navi1 = UINavigationController(rootViewController: firstViewController)
        let navi2 = UINavigationController(rootViewController: secondViewController)
        let controllers = [navi1, navi2]
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = controllers
        
        return tabViewController

    }
    
    
}

