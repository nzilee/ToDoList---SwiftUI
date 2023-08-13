//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Nikola Zivkovic on 8/13/23.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift!"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Build Apps!"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Change The World!"))
    }
    
    func saveToDo(toDo: ToDo) {
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
