//
//  ViewController.swift
//  coreMl1
//
//  Created by USER on 2017/09/17.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit
import Vision
import CoreML
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var photoDisplay: UIImageView!
    @IBOutlet weak var photoInfoDisplay: UITextView!
    var imagePicker: UIImagePickerController!
    //text detection
    var session = AVCaptureSession()
    var requests = [VNRequest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        //text detection
//        startLiveVideo()
//        startTextDetection()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhoto(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoDisplay.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoDisplay.contentMode = UIViewContentMode.scaleAspectFit
//        photoDisplay.contentMode = UIViewContentMode.center
        imagePicker.dismiss(animated: true, completion: nil)
        
//        let confirmViewController = ConfirmViewController()
//        confirmViewController.image = photoDisplay.image
//        present(confirmViewController, animated: true, completion: nil)
        let photoViewController = PhotoViewController()
        DispatchQueue.global(qos: .default).async {
            
            photoViewController.image = self.photoDisplay.image
            self.present(photoViewController, animated: true, completion: nil)
        }
        
        print("photoViewController.getImage()")
        self.photoDisplay.image = photoViewController.getImage()
        
        imageInference(image: (info[UIImagePickerControllerOriginalImage] as? UIImage)!)
        
    }
    
    func imageInference(image: UIImage) {
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model)  else {
            fatalError("modelをロードできません。")
        }
        
        // リクエスト（VNCoreMLRequest）の生成とハンドラ処理
        print("リクエスト（VNCoreMLRequest）の生成とハンドラ処理")
        let request = VNCoreMLRequest(model: model) { request, error in
            
            guard let results = request.results as? [VNClassificationObservation],
                let firstResult = results.first else {
                fatalError("Error results")
            }


            DispatchQueue.main.async {
                self.photoInfoDisplay.text = "確率 = \(Int(firstResult.confidence * 100))% , \n 詳細 \((firstResult.identifier))"
            }
            
            guard let ciImage = CIImage(image: image) else {
                fatalError("Error convert CIImage")
            }
            
            let imageHandler = VNImageRequestHandler(ciImage: ciImage)
            
            DispatchQueue.global(qos: .userInteractive).async {
                do {
                    try imageHandler.perform([request])
                } catch {
                    print("error")
                }
                
            }
            
        }
        
        // CIImageへの変換
        guard let ciImage = CIImage(image: image) else {
            fatalError("Error convert CIImage")
        }
        
        // ハンドラの生成と実行
        print("ハンドラの生成と実行")
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        guard (try? handler.perform([request])) != nil else {
            fatalError("Error handler.perform")
        }
        
        
    }
    
    func startLiveVideo() {
        //1
        session.sessionPreset = AVCaptureSession.Preset.photo
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        //2
        let deviceInput = try! AVCaptureDeviceInput(device: captureDevice!)
        let deviceOutput = AVCaptureVideoDataOutput()
        deviceOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        deviceOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))
        session.addInput(deviceInput)
        session.addOutput(deviceOutput)
        
        //3
        let imageLayer = AVCaptureVideoPreviewLayer(session: session)
        imageLayer.frame = photoDisplay.bounds
        photoDisplay.layer.addSublayer(imageLayer)
        
        session.startRunning()
    }
    
    func startTextDetection() {
        let textRequest = VNDetectTextRectanglesRequest(completionHandler: self.detectTextHandler)
        textRequest.reportCharacterBoxes = true
        self.requests = [textRequest]
    }
    
    func detectTextHandler(request: VNRequest, error: Error?) {
        guard let observations = request.results else {
            print("no result")
            return
        }
        
        let result = observations.map({$0 as? VNTextObservation})
        
        DispatchQueue.main.async() {
            self.photoDisplay.layer.sublayers?.removeSubrange(1...)
            for region in result {
                guard let rg = region else {
                    continue
                }
                
                self.highlightWord(box: rg)
                
                if let boxes = region?.characterBoxes {
                    for characterBox in boxes {
                        self.highlightLetters(box: characterBox)
                    }
                }
            }
        }
    }
    
    func highlightWord(box: VNTextObservation) {
        guard let boxes = box.characterBoxes else {
            return
        }
        
        var maxX: CGFloat = 9999.0
        var minX: CGFloat = 0.0
        var maxY: CGFloat = 9999.0
        var minY: CGFloat = 0.0
        
        for char in boxes {
            if char.bottomLeft.x < maxX {
                maxX = char.bottomLeft.x
            }
            if char.bottomRight.x > minX {
                minX = char.bottomRight.x
            }
            if char.bottomRight.y < maxY {
                maxY = char.bottomRight.y
            }
            if char.topRight.y > minY {
                minY = char.topRight.y
            }
        }
        
        let xCord = maxX * photoDisplay.frame.size.width
        let yCord = (1 - minY) * photoDisplay.frame.size.height
        let width = (minX - maxX) * photoDisplay.frame.size.width
        let height = (minY - maxY) * photoDisplay.frame.size.height
        
        let outline = CALayer()
        outline.frame = CGRect(x: xCord, y: yCord, width: width, height: height)
        outline.borderWidth = 2.0
        outline.borderColor = UIColor.red.cgColor
        
        photoDisplay.layer.addSublayer(outline)
    }
    
    func highlightLetters(box: VNRectangleObservation) {
        let xCord = box.topLeft.x * photoDisplay.frame.size.width
        let yCord = (1 - box.topLeft.y) * photoDisplay.frame.size.height
        let width = (box.topRight.x - box.bottomLeft.x) * photoDisplay.frame.size.width
        let height = (box.topLeft.y - box.bottomLeft.y) * photoDisplay.frame.size.height
        
        let outline = CALayer()
        outline.frame = CGRect(x: xCord, y: yCord, width: width, height: height)
        outline.borderWidth = 1.0
        outline.borderColor = UIColor.blue.cgColor
        
        photoDisplay.layer.addSublayer(outline)
    }
}


extension ViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        var requestOptions:[VNImageOption : Any] = [:]
        
        if let camData = CMGetAttachment(sampleBuffer, kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, nil) {
            requestOptions = [.cameraIntrinsics:camData]
        }
        
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: CGImagePropertyOrientation(rawValue: 6)!, options: requestOptions)
        
        do {
            try imageRequestHandler.perform(self.requests)
        } catch {
            print(error)
        }
    }
}

