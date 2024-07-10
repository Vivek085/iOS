import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext! 

    @IBOutlet var docname: UILabel!
    @IBOutlet var doctype: UILabel!
    
    @IBOutlet var pname: UILabel!
    @IBOutlet var prob: UILabel!
    @IBOutlet var padd: UILabel!
    @IBOutlet var mobile: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize 'context' here
        context = appDelegate.persistentContainer.viewContext
        pdata()
    }

    func doc(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DoctorEntity")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result{
                let data = data as AnyObject
                let drname = data.value(forKey: "docename") ?? ""
                let drtype = data.value(forKey: "docetype") ?? ""
                docname.text = " Name :  \(drname)"
                doctype.text = " Type : \(drtype)"
            }
        }catch{
            debugPrint("Error in Fetch")
            print("Error in Fetch")
        }
    }

    func pdata(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PaitentEntity")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result{
                let data = data as AnyObject
                let ptname = data.value(forKey: "pEname") ?? ""
                let probV = data.value(forKey: "pEprob") ?? ""
                let add = data.value(forKey: "pEadd") ?? ""
                let mob = data.value(forKey: "pEmob") ?? ""
                pname.text = " Name : \(ptname)"
                prob.text = " Problem : \(probV)"
                padd.text = " Address : \(add)"
                mobile.text = " Mobile : \(mob)"
            }
        }catch{
            debugPrint("Error in Fetch")
            print("Error in Fetch")
        }
    }
}
