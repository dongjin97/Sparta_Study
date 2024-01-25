//
//  Input.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
class Util {
    static func readInput() -> Int? {
        guard let input = readLine() else { return nil }
        return Int(input)
    }
}
