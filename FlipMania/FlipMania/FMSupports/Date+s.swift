//
//  Date+s.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//

import UIKit

extension Date {
    
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: Date())
    }
    
    static func getNextMonthDateFromCurrentDate(monthCount: Int) -> String {
        let nextMonth = Calendar.current.date(byAdding: .month, value: monthCount, to: Date()) ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: nextMonth)
    }
    
    static func getCurrentDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy - HH:mm"
        return dateFormatter.string(from: Date())
    }
}
