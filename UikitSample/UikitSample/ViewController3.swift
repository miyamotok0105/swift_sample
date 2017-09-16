
import UIKit


//final class NavigationViewController3: UINavigationController {
//    override func viewDidLoad() { super.viewDidLoad() }
//}

class ViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "ナビゲーション"
        self.addLabel1()
        self.addButton1()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLabel1() {
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/10 - bHeight/10
        let label: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.textColor = UIColor.white
        label.text = "Second view"
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(label)
    }
    
    func addButton1() {
        var myButton: UIButton!
        myButton = UIButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/5 - bHeight/5
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("ボタン(通常)", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.setTitle("ボタン(押された時)", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        myButton.tag = 1
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    internal func onClickMyButton(sender: UIButton) {
        print("onClickMyButton:");
        print("sender.currentTitle: \(sender.currentTitle!)")
        print("sender.tag: \(sender.tag)")
    }
    
}

