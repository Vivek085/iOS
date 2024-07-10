//
//  cricketerTableView.swift
//  cricker_data
//
//  Created by bmiit on 05/03/24.
//

import UIKit
//var data: [Cricketers] = []
var avg:Double  = 0.0


class cricketerTableView: UITableViewController {

    @IBOutlet weak var lblplayer: UILabel!
    @IBOutlet weak var lblmatche: UILabel!
    @IBOutlet weak var lblage: UILabel!
    var cricketers = [cricketer(name: "Demo1", age: 25, match: 20, innings: 15, score: 500, notoutn: 10),cricketer(name: "Demo2", age: 29, match: 35, innings: 30, score: 700, notoutn: 28
                                                                                                                        
                                                                                                                        )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        lblplayer.text = " Players = \(String(cricketers.count))"
        lblage.text = " Age = \(String(cricketers.lazy.compactMap { $0.age }.reduce(0, +) / cricketers.count))"
        lblmatche.text = " Matche = \(String(cricketers.lazy.compactMap { $0.match }.reduce(0, +) / cricketers.count))"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func adddata(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add cricketers Data", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        alert.addTextField { textField in
            textField.placeholder = "Age"
        }
        alert.addTextField { textField in
            textField.placeholder = "Number of Match"
        }
        alert.addTextField { textField in
            textField.placeholder = "Number of Innings"
        }
        alert.addTextField { textField in
            textField.placeholder = "Scored Run"
        }
        alert.addTextField { textField in
            textField.placeholder = "Number of Notout"
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [self] _ in
            if let crname = alert.textFields?[0].text,
               let age = alert.textFields?[1].text,
               let match = alert.textFields?[2].text,
               let inning = alert.textFields?[3].text,
               let score = alert.textFields?[4].text,
               let notout = alert.textFields?.last?.text {
                
                let cricketer = cricketer(name: crname, age: Int(age)! ?? 0, match: Int(match)! ?? 0, innings: Int(inning)! ?? 0, score: Int(score)! ?? 0, notoutn: Int(notout)! ?? 0)
                cricketers.append(cricketer)
                lblplayer.text = " Players = \(String(cricketers.count))"
                lblage.text = " Age = \(String(cricketers.lazy.compactMap { $0.age }.reduce(0, +) / cricketers.count))"
                tableView.reloadData()
                
                
            }
        }
        
        alert.addAction(submitAction)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (action) -> Void in
            print("Cancelled")
        }))

        present(alert, animated: true, completion: nil)
        tableView.reloadData()
        
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cricketers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.numberOfLines = 5
        
        let score:Double = Double(cricketers[indexPath.row].score)
        let inning:Double = Double(cricketers[indexPath.row].innings)
        let notout:Double = Double(cricketers[indexPath.row].notoutn)
        
        avg = score / (inning - notout)

        cell.textLabel?.text = "name = \(cricketers[indexPath.row].name) \n age = \(cricketers[indexPath.row].age) \n matches = \(cricketers[indexPath.row].match) \n run = \(cricketers[indexPath.row].score) \n avg run = \(avg)"
    
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Edit cricketers Data", message: "", preferredStyle: .alert)
        let lblname = UILabel(frame: CGRect(x: 180, y: 65, width: 150, height: 20))
        lblname.text = "name"
        alert.view.addSubview(lblname)
        let lblage = UILabel(frame: CGRect(x: 180, y: 95, width: 150, height: 20))
        lblage.text = "age"
        alert.view.addSubview(lblage)
        let lblmatch = UILabel(frame: CGRect(x: 180, y: 130, width: 150, height: 20))
        lblmatch.text = "Matche"
        alert.view.addSubview(lblmatch)
        let lblinn = UILabel(frame: CGRect(x: 180, y: 160, width: 150, height: 20))
        lblinn.text = "inning"
        alert.view.addSubview(lblinn)
        let lblrun = UILabel(frame: CGRect(x: 180, y: 190, width: 150, height: 20))
        lblrun.text = "Runs"
        alert.view.addSubview(lblrun)
        let lblnout = UILabel(frame: CGRect(x: 180, y: 220, width: 150, height: 20))
        lblnout.text = "Not not"
        alert.view.addSubview(lblnout)
        
        
        //2. Add the text field. You can configure it however you need.
        
        alert.addTextField { [self] textField in
            textField.placeholder = "Name"
            textField.text = String(cricketers[indexPath.row].name)
        }
        alert.addTextField { [self] textField in
            textField.placeholder = "Age"
            textField.text = String(cricketers[indexPath.row].age)
        }
        alert.addTextField { [self] textField in
            textField.placeholder = "Number of Match"
            textField.text = String(cricketers[indexPath.row].match)
        }
        alert.addTextField { [self] textField in
            textField.placeholder = "Number of Innings"
            textField.text = String(cricketers[indexPath.row].innings)
        }
        alert.addTextField { [self] textField in
            textField.placeholder = "Scored Run"
            textField.text = String(cricketers[indexPath.row].score)
        }
        alert.addTextField { [self] textField in
            textField.placeholder = "Number of Notout"
            textField.text = String(cricketers[indexPath.row].notoutn)
        }
        

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [self] _ in
            if let crname = alert.textFields?[0].text,
               let age = alert.textFields?[1].text,
               let match = alert.textFields?[2].text,
               let inning = alert.textFields?[3].text,
               let score = alert.textFields?[4].text,
               let notout = alert.textFields?.last?.text {
                
                
                cricketers[indexPath.row].name = crname
                cricketers[indexPath.row].age = Int(age)!
                cricketers[indexPath.row].match = Int(match)!
                cricketers[indexPath.row].innings = Int(inning)!
                cricketers[indexPath.row].score = Int(score)!
                cricketers[indexPath.row].notoutn = Int(notout)!

                lblage.text = String(cricketers.lazy.compactMap { $0.age }.reduce(0, +) / cricketers.count)
                tableView.reloadData()
                
                
            }
        }

        alert.addAction(submitAction)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (action) -> Void in
            print("Cancelled")
        }))

        present(alert, animated: true, completion: nil)
        tableView.reloadData()
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            cricketers.remove(at: indexPath.row)
            lblplayer.text = " Players = \(String(cricketers.count))"
            lblage.text = " Age = \(String(cricketers.lazy.compactMap { $0.age }.reduce(0, +) / cricketers.count))"
            lblmatche.text = " Matche = \(String(cricketers.lazy.compactMap { $0.match }.reduce(0, +) / cricketers.count))"

            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
