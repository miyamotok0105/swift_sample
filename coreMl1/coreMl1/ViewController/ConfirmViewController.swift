//
//  ALConfirmViewController.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2015/06/30.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit
import Photos

public class ConfirmViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView:UIImageView!
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    public var image: UIImage? = nil
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Screen Size の取得
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        // UIImage インスタンスの生成
//        let image = UIImage(named:"img")!
        
        // 画像の幅・高さの取得
        width = self.image!.size.width
        height = self.image!.size.height
        
        // UIImageView インスタンス生成
        imageView = UIImageView(image:image)
        
        // 画像サイズをスクリーン幅に合わせる
        scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView.frame = rect;
        
        // 画像の中心をスクリーンの中心位置に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        // view に ImageView を追加する
        self.view.addSubview(imageView)
        
        
        // ボタンを２つ生成
        let buttonPlus = UIButton()
        let buttonMinus = UIButton()
        
        // ボタンの位置とサイズを設定
        buttonPlus.frame = CGRect(x:screenWidth/4-30, y:screenHeight-100, width:screenWidth/4+20, height:35)
        buttonMinus.frame = CGRect(x:screenWidth/2+10, y:screenHeight-100, width:screenWidth/4+20, height:35)
        
        // ボタンのタイトルを設定
        buttonPlus.setTitle("+", for:UIControlState.normal)
        buttonMinus.setTitle("-", for:UIControlState.normal)
        
        // タイトルの色
        buttonPlus.setTitleColor(UIColor.black, for: .normal)
        buttonMinus.setTitleColor(UIColor.black, for: .normal)
        
        // 背景色
        buttonPlus.backgroundColor = UIColor.white
        buttonMinus.backgroundColor = UIColor.white
        
        // タップされたときのaction
        buttonPlus.addTarget(self, action: #selector(ConfirmViewController.plus(sender:)), for: .touchUpInside)
        buttonMinus.addTarget(self, action: #selector(ConfirmViewController.minus(sender:)), for: .touchUpInside)
        
        // Viewにボタンを追加
        self.view.addSubview(buttonPlus)
        self.view.addSubview(buttonMinus)
        
        // 画面背景を設定
        self.view.backgroundColor = UIColor(red:1.0,green:0.8,blue:0.5,alpha:1.0)
        
    }
    
    // 画像拡大
    @IBAction func plus(sender: AnyObject) {
        
        if(width*scale < screenWidth*2 ){
            scale += 0.2
        }
        
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        imageView.frame = rect;
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        self.view.addSubview(imageView)
        
    }
    
    // 画像縮小
    @IBAction func minus(sender: AnyObject) {
        
        if(width*scale > screenWidth/4){
            scale -= 0.2
        }
        
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        imageView.frame = rect;
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        self.view.addSubview(imageView)
        
    }
    
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var imageView = UIImageView()
//    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var cropOverlay: CropOverlay!
//    @IBOutlet weak var cancelButton: UIButton!
//    @IBOutlet weak var confirmButton: UIButton!
//    @IBOutlet weak var centeringView: UIView!
//
//    public var image: UIImage? = nil
//
////    public init(image: UIImage) {
//////        self.croppingParameters = croppingParameters
//////        self.asset = nil
////        self.image = image
//////        super.init(nibName: "ConfirmViewController", bundle: CameraGlobals.shared.bundle)
////    }
//
//    public override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor.black
//        scrollView.addSubview(imageView)
//        scrollView.delegate = self
//        scrollView.maximumZoomScale = 1
//        cropOverlay.isHidden = false
//
//        self.configureWithImage(image!)
//
//
//    }
//
//    var screenWidth:CGFloat = 0
//    var screenHeight:CGFloat = 0
//    var scale:CGFloat = 1.0
//
//    private func configureWithImage(_ image: UIImage) {
////        cropOverlay.isHidden = !croppingParameters.isEnabled
//
////        buttonActions()
//
//        imageView.image = image
//
//        screenWidth = self.view.bounds.width
//        screenHeight = self.view.bounds.height
//        scale = screenWidth / image.size.width
//        let rect:CGRect = CGRect(x:0, y:0, width:image.size.width*scale, height:image.size.height*scale)
//        imageView.frame = rect
//
////        imageView = UIImageView(image:image)
//
//
////        imageView.frame = CGRect(x:0,y:0,width:image.size.width,height:image.size.height)
////        imageView.frame.width = image.size.width
////        imageView.frame.height = image.size.height
//
//        print("image size")
//        print(image.size.height)
//        print(image.size.width)
//        print("image view size")
//        print(imageView.bounds.height)
//        print(imageView.bounds.width)
//
//        imageView.sizeToFit()
//        view.setNeedsLayout()
//    }



}

