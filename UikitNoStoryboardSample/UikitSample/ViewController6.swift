
import UIKit

class ViewController6: UIViewController {
    
    var myLabels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.title = "同期　非同期"
        self.addLabel1()
        self.addButton1()
        self.addLabelLoop(num: 1.0)
        self.addLabelLoop(num: 2.0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLabel1() {
        let bWidth: CGFloat = 500
        let bHeight: CGFloat = 100
        let posX: CGFloat = self.view.bounds.width/2 - bWidth/2
        let posY: CGFloat = self.view.bounds.height/10 - bHeight/10
        let label: UILabel = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.textColor = UIColor.white
        label.text = "キュー管理することで適切な\n スレッド上で処理が行われる"
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0 //複数行表示
        self.view.backgroundColor = UIColor.cyan
        self.view.addSubview(label)
    }
    
    func addButton1() {
        var myButton: UIButton!
        myButton = UIButton()
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/3 - bHeight/5
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("let's animation!!!", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.setTitle("go!!", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        myButton.tag = 1
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    func addLabelLoop(num: CGFloat) {
        let bWidth: CGFloat = 50
        let bHeight: CGFloat = 50
        let posX: CGFloat = (self.view.bounds.width/10) * 1
        let posY: CGFloat = (self.view.bounds.height/10) * (5 + num)
        let label = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.textColor = UIColor.white
        label.text = "*･゜ﾟ･*:.｡..｡.:*･゜"
        label.shadowColor = UIColor.gray
        label.textAlignment = NSTextAlignment.center
        label.tag = Int(num)
        self.view.backgroundColor = UIColor.cyan
        self.myLabels.append(label)
        self.view.addSubview(label)
    }
    
    
    
    internal func onClickMyButton(sender: UIButton) {
        print("onClickMyButton:");
        print("sender.currentTitle: \(sender.currentTitle!)")
        print("sender.tag: \(sender.tag)")
        
        wait_atleast(time: 1.0) { [weak self] in
            print("do1")
            self?.doAnimation(label: (self?.myLabels[0])!)
        }
        
        sleep(1)
        print("do2")
        self.doAnimation2(label: self.myLabels[1])
        
    }
    
    func dispatchSync() {
        let queue = DispatchQueue.global()
        queue.sync {
            print("dispatch_sync")
        }
    }
    
    func wait_atleast(time : TimeInterval, _ block: () -> Void) {
        let start = CFAbsoluteTimeGetCurrent()
        block()
        let end = CFAbsoluteTimeGetCurrent()
        let wait = max(0.0, time - (end - start))
        if wait > 0.0 {
            Thread.sleep(forTimeInterval: wait)
        }
    }
    
    func doAnimation(label: UILabel) {
        sleep(1)
        label.text = "!!"
        UIView.animate(withDuration: 0.4, // 遅延時間.
            delay: 0.0, // バネの弾性力. 小さいほど弾性力は大きくなる.
            usingSpringWithDamping: 0.2, // 初速度.
            initialSpringVelocity: 1.5, // 一定の速度.
            options: UIViewAnimationOptions.curveLinear,
            animations: { () -> Void in
                label.layer.position = CGPoint(x: label.layer.position.x-50, y: label.layer.position.y) // アニメーション完了時の処理
        }) { (Bool) -> Void in
            label.layer.position = CGPoint(x: label.layer.position.x+50, y: label.layer.position.y)
        }
        
    }
    
    func doAnimation2(label: UILabel) {
        sleep(1)
        label.text = "!!"
        UIView.animate(withDuration: 0.4, // 遅延時間.
            delay: 0.0, // バネの弾性力. 小さいほど弾性力は大きくなる.
            usingSpringWithDamping: 0.2, // 初速度.
            initialSpringVelocity: 1.5, // 一定の速度.
            options: UIViewAnimationOptions.curveLinear,
            animations: { () -> Void in
                label.layer.position = CGPoint(x: label.layer.position.x-50, y: label.layer.position.y) // アニメーション完了時の処理
        }) { (Bool) -> Void in
            label.layer.position = CGPoint(x: label.layer.position.x+50, y: label.layer.position.y)
        }
        
    }
}


