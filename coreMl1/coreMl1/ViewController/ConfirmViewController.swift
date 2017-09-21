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
    
    var imageView = UIImageView()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cropOverlay: CropOverlay!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var centeringView: UIView!

    public var image: UIImage? = nil

//    public init(image: UIImage) {
////        self.croppingParameters = croppingParameters
////        self.asset = nil
//        self.image = image
////        super.init(nibName: "ConfirmViewController", bundle: CameraGlobals.shared.bundle)
//    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        scrollView.maximumZoomScale = 1
        cropOverlay.isHidden = false

        self.configureWithImage(image!)


    }

    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    var scale:CGFloat = 1.0

    private func configureWithImage(_ image: UIImage) {
//        cropOverlay.isHidden = !croppingParameters.isEnabled

//        buttonActions()

        imageView.image = image

        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        scale = screenWidth / image.size.width
        let rect:CGRect = CGRect(x:0, y:0, width:image.size.width*scale, height:image.size.height*scale)
        imageView.frame = rect

//        imageView = UIImageView(image:image)


//        imageView.frame = CGRect(x:0,y:0,width:image.size.width,height:image.size.height)
//        imageView.frame.width = image.size.width
//        imageView.frame.height = image.size.height

        print("image size")
        print(image.size.height)
        print(image.size.width)
        print("image view size")
        print(imageView.bounds.height)
        print(imageView.bounds.width)

        imageView.sizeToFit()
        view.setNeedsLayout()
    }

}

