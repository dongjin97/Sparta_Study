//
//  UILabel+Extension.swift
//  IndividualTask
//
//  Created by 원동진 on 1/25/24.
//

import Foundation
import UIKit
extension UILabel{
    func setRangeTextFont(fullText: String,range: String,uiFont : UIFont){
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = ( fullText as NSString).range(of: range)
        attributedString.addAttribute(.font, value: uiFont, range: range)
        self.attributedText = attributedString
    }
}
