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
        toDos.append(ToDo(item: "Learn Swift!"))
        toDos.append(ToDo(item: "Build Apps!"))
        toDos.append(ToDo(item: "Change The World!"))
    }
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        if newToDo {
            toDos.append(toDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
    
    func onDelete(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func onMove(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
