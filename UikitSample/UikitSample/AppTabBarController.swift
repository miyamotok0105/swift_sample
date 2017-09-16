//import UIKit
//
//final class AppTabBarController: UITabBarController {
//    
//    
//    // タブ１
//    private lazy var navigationViewController: NavigationViewController = {
//        let vc = ViewController()
//        let nav = NavigationViewController(rootViewController: vc)
//        return nav
//    }()
//    
//    // タブ２
//    private lazy var navigationViewController2: NavigationViewController2 = {
//        let vc = ViewController2()
//        let nav = NavigationViewController2(rootViewController: vc)
//        return nav
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let viewControllers: [UIViewController] = [
//            navigationViewController,
//            navigationViewController2
//        ]
//        
//        setViewControllers(viewControllers, animated: false)
//        self.view.addSubview(viewControllers)
//    }
//    
//    override func viewWillLayoutSubviews() {
//        
////        self.navigationController?.pushViewController(navigationViewController, animated: true)
//    }
//    
//    override func viewDidLayoutSubviews() {
////        postButton.frame = CGRect(origin: .zero, size: CGSize(width: 90, height: 75.375))
////        postButton.center = CGPoint(x: tabBar.bounds.width / 2, y: tabBar.bounds.height - (postButton.bounds.height / 2))
//    }
//    
//    
//}
