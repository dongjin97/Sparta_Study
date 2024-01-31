//
//  UIView+Extension.swift
//  IndividualTask
//
//  Created by 원동진 on 2024/01/25.
//

import Foundation
import UIKit
extension UIView{
    func addSubViews(_ views : [UIView]){
        _ = views.map{self.addSubview($0)}
    }

}
