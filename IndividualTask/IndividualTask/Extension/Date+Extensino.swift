//
//  DateExtensino.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/21.
//

import Foundation
import UIKit
extension Date {
    func changeString() -> String{ // Date format 함수
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
