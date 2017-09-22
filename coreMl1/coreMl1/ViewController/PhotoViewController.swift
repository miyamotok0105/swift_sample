//
//  PhotoViewController.swift
//  coreMl1
//
//  Created by USER on 2017/09/22.
//  Copyright © 2017年 USER. All rights reserved.
//

import Foundation
import UIKit
import Photos

public class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var labelX: UILabel!
    @IBOutlet var labelY: UILabel!
    var imageView:UIImageView!
    let imageFilter = UIImageView()
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    public var image: UIImage? = nil
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load")
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        width = self.image!.size.width
        height = self.image!.size.height
        
        imageView = UIImageView(image:image)
        scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        imageView.frame = rect
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        self.view.addSubview(imageView)
        print("imageView is \(imageView)")
        
        imageFilter.image = UIImage(named: "square-targeting-interface-symbol")
        imageFilter.frame = CGRect(x:0, y:0, width:128, height:128)
        imageFilter.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        imageFilter.isUserInteractionEnabled = true
        self.view.addSubview(imageFilter)
        
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
        
        
        let buttonPlus = UIButton()
        let buttonMinus = UIButton()
        let buttonOk = UIButton()

        buttonPlus.frame = CGRect(x:screenWidth/4-30, y:screenHeight-100, width:screenWidth/4+20, height:35)
        buttonMinus.frame = CGRect(x:screenWidth/2+10, y:screenHeight-100, width:screenWidth/4+20, height:35)
        buttonOk.frame = CGRect(x:screenWidth/4-30, y:screenHeight-50, width:screenWidth/4+20, height:35)
        
        buttonPlus.setTitle("+", for:UIControlState.normal)
        buttonMinus.setTitle("-", for:UIControlState.normal)
        buttonOk.setTitle("OK", for:UIControlState.normal)
        buttonPlus.setTitleColor(UIColor.black, for: .normal)
        buttonMinus.setTitleColor(UIColor.black, for: .normal)
        buttonOk.setTitleColor(UIColor.black, for: .normal)
        buttonPlus.backgroundColor = UIColor.white
        buttonMinus.backgroundColor = UIColor.white
        buttonOk.backgroundColor = UIColor.white
        buttonPlus.addTarget(self, action: #selector(PhotoViewController.plus(sender:)), for: .touchUpInside)
        buttonMinus.addTarget(self, action: #selector(PhotoViewController.minus(sender:)), for: .touchUpInside)
        buttonOk.addTarget(self, action: #selector(PhotoViewController.ok(sender:)), for: .touchUpInside)
        self.view.addSubview(buttonPlus)
        self.view.addSubview(buttonMinus)
        self.view.addSubview(buttonOk)
        self.view.backgroundColor = UIColor(red:1.0,green:0.8,blue:0.9,alpha:1.0)
    }
    
    @IBAction func plus(sender: AnyObject) {
        if(width*scale < screenWidth*2 ){
            scale += 0.2
        }
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        imageView.frame = rect;
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
    }
    
    @IBAction func minus(sender: AnyObject) {
        if(width*scale > screenWidth/4){
            scale -= 0.2
        }
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        imageView.frame = rect;
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
    }
    
    @IBAction func ok(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // 画面にタッチで呼ばれる
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
    }
    
    //　ドラッグ時に呼ばれる
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
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
        var viewFrame: CGRect = imageFilter.frame
        
        // 移動分を反映させる
        viewFrame.origin.x += dx
        viewFrame.origin.y += dy
        
        imageFilter.frame = viewFrame
        
        self.view.addSubview(imageFilter)
        
        labelX.text = "x:\(newDx)"
        labelY.text = "y:\(newDy)"
        
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("End")
    }
    
    public func getImage() -> UIImage! {
        
        let image = UIImage(named: "square-targeting-interface-symbol")
        //todo:たぶんimageView.imageがおかしい
        print("imageView is ...")
        print(imageView)
        print(labelX)
        print(labelX.text)
        
//        let image = imageView.image.cropping(to: CGRect(x: Int(labelX.text ?? "0")!, y: Int(labelY.text ?? "0")!, width: 128, height: 128))
        return image
    }
    
    
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIImage {
    func cropping(to: CGRect) -> UIImage? {
        var opaque = false
        if let cgImage = cgImage {
            switch cgImage.alphaInfo {
            case .noneSkipLast, .noneSkipFirst:
                opaque = true
            default:
                break
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(to.size, opaque, scale)
        draw(at: CGPoint(x: -to.origin.x, y: -to.origin.y))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}

