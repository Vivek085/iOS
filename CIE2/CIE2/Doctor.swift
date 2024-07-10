import UIKit
import CoreData

class Doctor: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var submitdoc: UIButton!
    @IBOutlet var dtype: UITextField!
    
    var pickerData = ["Genral", "Dermatologist", "Nurologist"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // For a single column picker view
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // MARK: - Button Action
    @IBAction func saveincore(_ sender: Any) {
        let n:String = String(textField.text!)
        let type:String = String(dtype.text!)
        
        //var ty:String = pickerView
        print("\(n)")
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        
        // Check if the selected row is within bounds
        guard selectedRow >= 0 && selectedRow < pickerData.count else {
            print("Invalid selected row")
            return
        }
        
        let selectedOption = pickerData[selectedRow]
        guard let docn = textField.text else {
            print("Text field is empty")
            return
        }
        
        let objcon = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext 
                
       // let Context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "DoctorEntity", in: objcon)!
        let doc = NSManagedObject(entity: entity, insertInto: objcon)

        doc.setValue(docn, forKey: "docename")
        doc.setValue(type, forKey: "docetype")

        do {
            try objcon.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
       // print("type \()")
        
    }
    

}

