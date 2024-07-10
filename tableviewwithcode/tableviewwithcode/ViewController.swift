//
//  ViewController.swift
//  tableviewwithcode
//
//  Created by bmiit on 11/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    var plants = [plant(n: "Ruber" ,p: 100 ),plant(n: "lily" , p: 400)]

    var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
                
                // Register a cell type if needed
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
                
                // Set data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows you want to display
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure cell
        cell.textLabel?.text = plants[indexPath.row].name
        cell.detailTextLabel?.text = String(plants[indexPath.row].price)
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Handle row selection
        print("Selected row \(indexPath.row)")
    }
}
