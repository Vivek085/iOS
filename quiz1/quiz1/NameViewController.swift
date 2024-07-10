//
//  NameViewController.swift
//  quiz1
//
//  Created by bmiit on 13/02/24.
//

import UIKit

class NameViewController: UIViewController {

    let mview = UIView()
    var tbb = UITextField()
    var lbl = UILabel()
    let btn = UIButton(frame: CGRect(x: 100, y:200, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mview.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        mview.backgroundColor = .systemIndigo
        mview.clipsToBounds = true
        
        lbl.frame = CGRect(x: 50, y: 80, width: 300, height: 60)
        lbl.text = "Enter your name"
        lbl.textColor = .white
        lbl.textAlignment = .center
        view.addSubview(lbl)
        
        
        tbb.frame = CGRect(x: 10, y: 120, width: view.frame.size.width - 20, height: 60)
        tbb.textColor = .white
        tbb.placeholder = "text here"
        tbb.textAlignment = .center
        view.addSubview(tbb)
        
        btn.backgroundColor = .systemIndigo
        btn.backgroundColor = .systemIndigo
        btn.setTitle("Submit", for: .normal)
        
        btn.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
        view.addSubview(btn)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonTarget() {

     if let text = tbb.text
        {
            lbl.text = text
        }

    }

}
