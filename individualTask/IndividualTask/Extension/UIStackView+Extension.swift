//
//  UIStackView+Extension.swift
//  IndividualTask
//
//  Created by 원동진 on 2024/01/25.
//

import Foundation
import UIKit
extension UIStackView{
    func addStackSubViews(_ views : [UIView]){
        _ = views.map{self.addArrangedSubview($0)}
    }
}
