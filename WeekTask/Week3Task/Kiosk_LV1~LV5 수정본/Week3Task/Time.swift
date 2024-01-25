//
//  Timer.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
struct Time{
    var dateString: String {
        let date =  Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    func coverFormatter(_ date: Date) -> (String,Int){
        let dateComponent = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = dateComponent.hour!
        let hourChange = hour > 12 ? "오후 \(hour % 12) " : "오전\(hour%12)"
        let min = dateComponent.minute!
        
        return (hourChange,min)
    }
    
}
