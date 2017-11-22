import UIKit

//画像を動かせるよ
//https://i-app-tec.com/ios/image-drag.html
//良さげな素材
//http://www.freepik.com/free-photos-vectors/square-target

class ViewController5: UIViewController {
    
    @IBOutlet var labelX: UILabel!
    @IBOutlet var labelY: UILabel!
    
    // 画像インスタンス
    let imageBag = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Screen Size の取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        // ハンドバッグの画像を設定
        imageBag.image = UIImage(named: "golden-retriever-dog")
        // 画像のフレームを設定
        imageBag.frame = CGRect(x:0, y:0, width:128, height:128)
        // 画像をスクリーン中央に設定
        imageBag.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        // タッチ操作を enable
        imageBag.isUserInteractionEnabled = true
        self.view.addSubview(imageBag)
        
        let posX = 10
        let posY = 80
        let bWidth = 70
        let bHeight = 20
        self.labelX = UILabel(frame: CGRect(x: posX, y: posY, width: bWidth, height: bHeight))
        self.labelY = UILabel(frame: CGRect(x: posX, y: posY+20, width: bWidth, height: bHeight))
        self.labelX.backgroundColor = UIColor.orange
        self.labelY.backgroundColor = UIColor.orange
        self.view.addSubview(self.labelX)
        self.view.addSubview(self.labelY)
        
        labelX.text = "x:\(Int(screenWidth/2))"
        labelY.text = "y:\(Int(screenHeight/2))"
        
        // 画面背景を設定
        self.view.backgroundColor = UIColor(red:0.8,green:1.0,blue:0.9,alpha:1.0)
        
    }
    
    // 画面にタッチで呼ばれる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
    }
    
    //　ドラッグ時に呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチイベントを取得
        let touchEvent = touches.first!
        
        // ドラッグ前の座標, Swift 1.2 から
        let preDx = touchEvent.previousLocation(in: self.view).x
        let preDy = touchEvent.previousLocation(in: self.view).y
        
        // ドラッグ後の座標
        let newDx = touchEvent.location(in: self.view).x
        let newDy = touchEvent.location(in: self.view).y
        
        // ドラッグしたx座標の移動距離
        let dx = newDx - preDx
        print("x:\(dx)")
        
        // ドラッグしたy座標の移動距離
        let dy = newDy - preDy
        print("y:\(dy)")
        
        // 画像のフレーム
        var viewFrame: CGRect = imageBag.frame
        
        // 移動分を反映させる
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        
        imageBag.frame = viewFrame
        
        self.view.addSubview(imageBag)
        
        labelX.text = "x:\(newDx)"
        labelY.text = "y:\(newDy)"
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("End")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
