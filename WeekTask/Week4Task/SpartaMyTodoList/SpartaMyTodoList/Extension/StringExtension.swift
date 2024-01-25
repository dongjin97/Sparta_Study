//
//  StringExtension.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/21.
//

import Foundation
import UIKit
extension String{
    func strikeThroughString() ->NSMutableAttributedString{
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle,value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributedString.length))
        return attributedString
    }
}
