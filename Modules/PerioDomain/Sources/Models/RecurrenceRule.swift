//
//  RecurrenceRule.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 07/04/26.
//

import CoreFoundation
import Foundation

enum RecurrenceRule {
    
    enum CustomUnit {
        case days
        case weeks
    }
    
    case daily
    case weekly(days: Set<Locale.Weekday>)
    case monthly(day: Int)
    case custom(every: Int, unit: CustomUnit)
}
