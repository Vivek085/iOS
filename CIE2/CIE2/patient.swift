import UIKit
import CoreData

class patient: UIViewController {

    @IBOutlet weak var tbxname: UITextField!
    @IBOutlet weak var tbxproblem: UITextField!
    @IBOutlet weak var tbxadd: UITextField!
    @IBOutlet weak var tbxmobile: UITextField!
    
    let objcon = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // context = appDelegate.persistentContainer.viewContext
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Patient")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let name:String = String(tbxname.text!)
        let problem:String = String(tbxproblem.text!)
        let add:String = String(tbxadd.text!)
        let mob:String = String(tbxmobile.text!)
        
        print(name,problem,add,mob)
        
        if let entity = NSEntityDescription.entity(forEntityName: "PatientEntity", in: objcon) {
            let p = NSManagedObject(entity: entity, insertInto: objcon)
            p.setValue(name, forKey: "pEname")
            p.setValue(problem, forKey: "pEprob")
            p.setValue(add, forKey: "pEadd")
            p.setValue(mob, forKey: "pEmob")

            do {
                try objcon.save()
                // Fetch data function
            } catch {
                debugPrint("Can't save")
                print("Can't Save")
            }
        } else {
            print("Entity not found")
        }

        
    }
}


