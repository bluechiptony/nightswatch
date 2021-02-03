//
//   Task.swift
//  Nightswatch
//
//  Created by Anthony Egwu on 02/02/2021.
//  Copyright © 2021 Anthony Egwu. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name:String
    var isComplete:Bool
    var lastCompleted:Date?
    var tIndex:Int?
}


class NightsWatchTasks: ObservableObject {
    @Published var nightlyTasks:[Task] = [
        Task(name: "Check all windows", isComplete: false, lastCompleted: nil,tIndex: 0),
        Task(name: "Check all doors", isComplete: false, lastCompleted: nil, tIndex: 1),
        Task(name: "Check that the safe is locked", isComplete: false, lastCompleted: nil,tIndex:  2),
        Task(name: "Check the mailbox", isComplete: false, lastCompleted: nil,tIndex:  3),
        Task(name: "Inspect security cameras", isComplete: false, lastCompleted: nil,tIndex:  4),
        Task(name: "Clear ice from sidewalk", isComplete: false, lastCompleted: nil,tIndex:  5),
        Task(name: "Document \"stange and unusual\" occurences", isComplete: false, lastCompleted: nil, tIndex: 6)
    ]

    @Published var weeklyTasks : [Task] = [
        Task(name: "Check inside all vacant rooms", isComplete: false, lastCompleted: nil,tIndex:  0),
        Task(name: "Walk the perimeter of property", isComplete: false, lastCompleted: nil,tIndex:  1)
    ]


    @Published var monthlyTasks: [Task] = [
        Task(name: "Test security alarm", isComplete: false, lastCompleted: nil,tIndex:  0),
        Task(name: "Test motion detectors", isComplete: false, lastCompleted: nil,tIndex:  1),
        Task(name: "Test smoke alarms", isComplete: false, lastCompleted: nil, tIndex: 2)
    ]
}
