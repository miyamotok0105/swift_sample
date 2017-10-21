//
//  ViewController.swift
//  MyCamera
//
//  Created by USER on 2017/09/15.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    @IBAction func camera1LaunchAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            present(ipc, animated: true, completion: nil)
        } else {
            print("canot use camera")
        }
    }
    
    @IBAction func camera2LaunchAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            ipc.showsCameraControls = false
            present(ipc, animated: true, completion: nil)
        } else {
            print("canot use camera")
        }
    }
    
    @IBAction func camera3LaunchAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            ipc.allowsEditing = true
            present(ipc, animated: true, completion: nil)
        } else {
            print("canot use camera")
        }
    }
    
    @IBAction func camera4LaunchAction(_ sender: Any) {
        
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
        if picker.allowsEditing == true {
            photoImage.image = info[UIImagePickerControllerEditedImage] as? UIImage
            dismiss(animated: true, completion: nil)
        } else {
            photoImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    //https://stackoverflow.com/questions/34787019/swift-how-to-customize-uipickerview-with-two-bars-with-buttons
    //        if UIImagePickerController.isSourceTypeAvailable(.camera) {
    //            let ipc = UIImagePickerController()
    //            ipc.sourceType = .camera
    //            ipc.delegate = self
    //            ipc.showsCameraControls = false
    //            ipc.modalPresentationStyle = .fullScreen
    //            //customView stuff
    //            let customViewController = CustomOverlayViewController(
    //                nibName:"CustomOverlayViewController",
    //                bundle: nil
    //            )
    //            let customView:CustomOverlayView = customViewController.view as! CustomOverlayView
    //            customView.frame = self.imagePicker.view.frame
    //
    //            presentViewController(ipc, animated: true, completion: {
    //                self.imagePicker.cameraOverlayView = customView
    //            })
    //
    ////            present(ipc, animated: true, completion: nil)
    //        } else {
    //            print("canot use camera")
    //        }
    
}

