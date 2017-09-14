//
//  ViewController.swift
//  MyMap
//
//  Created by USER on 2017/09/14.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var displayMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inputText.delegate = self
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let searchKeyWord = textField.text
        print(searchKeyWord!)
        
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(<#T##addressString: String##String#>, completionHandler: <#T##CLGeocodeCompletionHandler##CLGeocodeCompletionHandler##([CLPlacemark]?, Error?) -> Void#>)
        
//        geocoder.geocodeAddressString(searchKeyWord!) { ([CLPlacemark]?, <#Error?#>) in
//            <#code#>
//        }
//        
//        geocoder.geocodeAddressString(searchKeyWord!, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
//            if let placemark = placemarks?[0] as? CLPlacemark {
//                // 目的地の座標を取得
//                self.destLocation = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude)
//                // 目的地にピンを立てる
//                self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
//                // 現在地の取得を開始
//                self.locationManager.startUpdatingLocation()
//            }
//        })

        CLGeocoder().geocodeAddressString(searchKeyWord!, completionHandler: {(placemarks, error) in
            
            if error != nil {
                print("Geocode failed with error:\(error!.localizedDescription)")
            } else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
                
                print(coords.latitude) //緯度
                print(coords.longitude) //経度
                
//                self.displayMap.addAnnotation(MKPlacemark(placemark: placemark))
                let pin = MKPointAnnotation()
                pin.coordinate = coords
                pin.title = searchKeyWord
                self.displayMap.addAnnotation(pin)
                self.displayMap.region = MKCoordinateRegionMakeWithDistance(coords, 500.0, 500.0)
                
            }
        })
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

