//
//  ViewController.swift
//  MyCamera
//
//  Created by USER on 2017/09/15.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraLaunchAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("カメラは使えます")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            
            present(ipc, animated: true, completion: nil)
            
            
            
        } else {
            print("カメラ使えないよ")
        }
    }

    @IBAction func shareAction(_ sender: Any) {
        if let sharedImage = photoImage.image {
            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true, completion: nil)
            
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
}

