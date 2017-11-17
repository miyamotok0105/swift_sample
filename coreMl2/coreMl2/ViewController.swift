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

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var photoDisplay: UIImageView!
    @IBOutlet weak var photoInfoDisplay: UITextView!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        
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
        imagePicker.dismiss(animated: true, completion: nil)
        imageInference(image: (info[UIImagePickerControllerOriginalImage] as? UIImage)!)
    }
    
    func imageInference(image: UIImage) {
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model)  else {
            fatalError("modelをロードできません。")
        }
        
        // リクエスト（VNCoreMLRequest）の生成とハンドラ処理
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
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        guard (try? handler.perform([request])) != nil else {
            fatalError("Error handler.perform")
        }
        
        
    }
}
