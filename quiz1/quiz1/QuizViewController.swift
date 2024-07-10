//
//  QuizViewController.swift
//  quiz1
//
//  Created by bmiit on 13/02/24.
//

import UIKit

class QuizViewController: UIViewController {

    let mview = UIView()
    let enterQNA = UIView()
    let showQNA = UIView()
    
    var storeque:[String] = [] ;
    var storeans:[String] = [] ;
    var gindx:Int!
    
    var tbb = UITextField()
    var tans = UITextField()
    var lbl = UILabel()
    let addQbtn = UIButton(frame: CGRect(x: 155, y:290, width: 100, height: 40))
    let addAbtn = UIButton(frame: CGRect(x: 70, y:250, width: 100, height: 40))

    var sQlbl = UILabel()
    var sAlbl = UILabel()
    let sQbtn = UIButton(frame: CGRect(x: 150, y:550, width: 100, height: 40))
    let sAbtn = UIButton(frame: CGRect(x: 150, y:720, width: 100, height: 40))

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mview.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        enterQNA.frame = CGRect(x: 10 , y: 10, width: view.frame.width-20, height: (mview.frame.height-20)/2)
        
        
        showQNA.frame = CGRect(x: 10 , y: (enterQNA.frame.maxY-10), width: mview.frame.width-20, height: (mview.frame.maxY-20)/2)

        mview.backgroundColor = .systemBackground
        mview.clipsToBounds = true
        
        enterQNA.backgroundColor = .secondarySystemFill
        view.addSubview(mview)
        mview.addSubview(enterQNA)
       
        
        lbl.frame = CGRect(x: 50, y: 80, width: 300, height: 80)
        lbl.text = "Enter Qus or ans and click add qus or ans btn"
        lbl.textColor = .black
        lbl.textAlignment = .center
        view.addSubview(lbl)
        
        
        tbb.frame = CGRect(x: 10, y: 120, width: view.frame.size.width - 20, height: 120)
        tbb.textColor = .black
        tbb.placeholder = "ADD QUS"
        tbb.textAlignment = .center
        view.addSubview(tbb)
        
        tans.frame = CGRect(x: 10, y: 180, width: view.frame.size.width - 20, height: 120)
        tans.textColor = .black
        tans.placeholder = "ADD ANS"
        tans.textAlignment = .center
        view.addSubview(tans)
        
        addQbtn.backgroundColor = .black
        addQbtn.setTitle("A QUS", for: .normal)
        addQbtn.addTarget(self, action: #selector(addqus), for: .touchUpInside)
        view.addSubview(addQbtn)
        /*
        addAbtn.backgroundColor = .gray
        addAbtn.setTitle("A ANS", for: .normal)
        addAbtn.addTarget(self, action: #selector(addans), for: .touchUpInside)
        view.addSubview(addAbtn)
        */
        
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //show question and answer
        
        sQlbl.frame = CGRect(x: 40, y: 420, width: 300, height: 80)
        sQlbl.text = "QUS"
        sQlbl.textColor = .black
        sQlbl.textAlignment = .center
        view.addSubview(sQlbl)

        sAlbl.frame = CGRect(x: 40, y: 650, width: 300, height: 80)
        sAlbl.text = "???"
        sAlbl.textColor = .black
        sAlbl.textAlignment = .center
        view.addSubview(sAlbl)

        
        
        showQNA.backgroundColor = .systemBrown
        mview.addSubview(showQNA)
        sQbtn.backgroundColor = .black
        sQbtn.setTitle("QUS", for: .normal)
        
        sQbtn.addTarget(self, action: #selector(squs), for: .touchUpInside)
        view.addSubview(sQbtn)
        
        sAbtn.backgroundColor = .black
        sAbtn.setTitle("ANS", for: .normal)
        sAbtn.addTarget(self, action: #selector(sans), for: .touchUpInside)
        view.addSubview(sAbtn)
    
    }
    
    @objc func addqus() {

        storeque.append(String(tbb.text!));
        storeans.append(String(tans.text!));
        tbb.placeholder = "Add QUS"
        tans.placeholder = "ADD ANS"
        

    }
    
    @objc func addans() {

        storeans.append(String(tbb.text!));
        
    }
    
    @objc func sans() {

        sAlbl.text = storeans[gindx];

    }
    
    @objc func squs() {

        let randomeque = storeque.randomElement()!
        sQlbl.text = randomeque;
        gindx = storeque.firstIndex(of: randomeque)
        sAlbl.text = "???"
        
    }

}
