//
//  ViewController.swift
//  Doc&paitent
//
//  Created by bmiit on 15/04/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context = NSManagedObjectContext()
    

    @IBOutlet var textview: UITextView!
    @IBOutlet var docnametbx: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        context = appDelegate.persistentContainer.viewContext
        fetchdata()
    }
    
    func fetchdata() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DoctorCore")
        request.returnsObjectsAsFaults = false
        request.resultType = .dictionaryResultType // Set resultType to dictionaryResultType
        request.propertiesToFetch = ["name"] // Specify the attribute you want to fetch

        do {
            let results = try context.fetch(request)
            for case let result as [String: Any] in results {
                if let name = result["name"] as? String {
                    textview.text += "Doctor name is \(name)\n"
                }
            }
        } catch {
            debugPrint("Error fetching data: \(error)")
        }
    }





    @IBAction func save(_ sender: Any) {
        
        textview.text = " "
        
        let name:String = String(docnametbx.text!)
        
        
        let entity = NSEntityDescription.entity(forEntityName: "DoctorCore", in: context)
        let data = NSManagedObject(entity: entity!, insertInto: context)
        data.setValue(name, forKey: "name")
      
        do{
            try context.save()
            fetchdata()
        }catch{
            debugPrint("Can't save")
            print("Can't Save")
        }
        
    }
    
    
    
}

