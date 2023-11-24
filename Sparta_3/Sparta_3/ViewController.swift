//
//  MyTableViewController.swift
//  Sparta_3
//
//  Created by 원동진 on 2023/11/24.
//

import UIKit
struct Family {
    let myName : String
    let besrFriendName : String
    let nextFriendName : String
    let myBrother : String
}
class ViewController: UIViewController {
    let friendNames : [String] = ["Henry","Leeo","Jay","Key"]
    let koreanNames : [String : String] = ["Henry":"헨리","Leeo":"리이오","Jay":"재이"]
    let friend = Family(myName: "Henry2", besrFriendName: "Leeo2", nextFriendName: "Jay2", myBrother: "Key")
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bestFriendNameLabel: UILabel!
    
    @IBOutlet weak var nextFriendNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapButton(_ sender: Any) {
        nameLabel.text = friend.myName
        bestFriendNameLabel.text = friend.besrFriendName
        nextFriendNameLabel.text = friend.nextFriendName
    }
}
