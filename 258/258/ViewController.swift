//
//  ViewController.swift
//  258
//
//  Created by bmiit on 07/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var t1: UITextField!
    
    @IBOutlet weak var l1: UILabel!
    @IBAction func btn(_ sender: Any) {
        
        l1.text = t1.text;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

