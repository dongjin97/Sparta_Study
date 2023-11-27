//
//  ViewController.swift
//  Sprata_2
//
//  Created by 원동진 on 2023/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapMyButton(_ sender: Any) {
        view.backgroundColor = .yellow
        helloLabel.text = "hello DongJin"
    }
    
}

