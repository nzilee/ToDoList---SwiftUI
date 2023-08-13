//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Nikola Zivkovic on 8/12/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
