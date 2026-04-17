//
//  RecurringItem.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 07/04/26.
//

import Foundation

struct RecurringItem {

    let id: UUID
    let title: String
    let icon: String
    let color: String
    let recurrence: RecurrenceRule
    let reminderTime: DateComponents?
    let sortOrder: Int
    let createdAt: Date
    let archivedAt: Date?
}
