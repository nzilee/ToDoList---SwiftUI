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
        loadData()
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
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func saveData() {
        let path = URL.documents.appendingPathComponent("toDos")
        let data = try? JSONEncoder().encode(toDos)
        
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        let path = URL.documents.appendingPathComponent("toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("😡 ERROR: Could not load the data \(error.localizedDescription)")
        }
    }
    
    func toggleCheckbox(toDo: ToDo) {
        
        guard toDo.id != nil else {return}
        
        var newToDo = toDo
        newToDo.isFinished.toggle()
        
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
            toDos[index] = newToDo
        }
        
        saveData()

    }
    
}

extension URL {

    static var documents: URL {
        return FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
