//
//  ProfileDesignTabBarController.swift
//  IndividualTask
//
//  Created by 원동진 on 1/29/24.
//
import UIKit

class ProfileDesignTabBarController: UITabBarController {
    let profileDesign = ProfileDesignVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    private func setTabBar(){
        self.viewControllers = [profileDesign]
        profileDesign.tabBarItem = UITabBarItem(title:"" , image: UIImage(named: "Profile")?.withTintColor(UIColor.black), tag: 1)
        self.tabBar.tintColor = .black
    }

}
