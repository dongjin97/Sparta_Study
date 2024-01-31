//
//  ViewController.swift
//  Sparta_3
//
//  Created by 원동진 on 2023/11/24.
//

import UIKit


class MyTableViewController: UIViewController {
    let friendNames : [String] = ["Henry","Leeo","Jay","Key"]
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.backgroundColor = .blue
        myTableView.dataSource = self
        myTableView.delegate = self
    }

}
extension MyTableViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = friendNames[indexPath.row]
        return cell
        
    }
    
    
}

