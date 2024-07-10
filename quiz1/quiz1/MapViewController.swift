//
//  MapViewController.swift
//  quiz1
//
//  Created by bmiit on 13/02/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapview : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapview = MKMapView()
        view = mapview

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
