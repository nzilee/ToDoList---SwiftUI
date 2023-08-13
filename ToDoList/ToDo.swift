//
//  ToDo.swift
//  ToDoList
//
//  Created by Nikola Zivkovic on 8/13/23.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String?
    var item: String = ""
    var reminderIsOn = false
    var dueDate: Date = .now + (60*60)
    var notes = ""
    var isFinished = false
}
