//
//  ViewController.swift
//  btnimg
//
//  Created by bmiit on 10/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgbg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func img1(_ sender: Any) {
        imgbg.image=UIImage(named: "car")
    }
    
    @IBAction func img2(_ sender: Any) {
        imgbg.image=UIImage(named: "deer")
    }
    
    
    @IBAction func img3(_ sender: Any) {
        imgbg.image=UIImage(named: "nyc")
    }
    
}

