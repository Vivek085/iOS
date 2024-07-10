//
//  ViewController.swift
//  registration
//
//  Created by bmiit on 23/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var fame: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var mobile: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var pass: UITextField!
    @IBOutlet var dob: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dv=segue.destination as? DetailViewController
        {
            dv.fn=fname.text
            dv.ln=lname.text
            dv.emailid=email.text
            dv.mobile=mobile.text
            dv.username=username.text
            dv.password=pass.text
            dv.dob="\(dob.date)"
        }
    }
    @IBAction func Register(_ sender: Any){
        performSegue(withIdentifier: "con", sender:sender)
    }
}
