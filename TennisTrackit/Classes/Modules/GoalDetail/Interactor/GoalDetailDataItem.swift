//
//  GoalDetailDataItem.swift
//  TennisTrackit
//
//  Created by Annie on 03/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation

struct GoalDetailDataItem {
    var title: String
    var description: String?
    var done: Bool
    var subtasks: [SubtaskDataItem]?
    var tags: [String]?
}

struct SubtaskDataItem {
    var title: String
    var done: Bool
}
