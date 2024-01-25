//
//  ExtensionUIViewController.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import Foundation
import UIKit
extension UIViewController{
    func pushVC( _ VC : UIViewController){ // 화면 Push 함수
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
