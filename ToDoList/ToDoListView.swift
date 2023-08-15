//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Nikola Zivkovic on 8/12/23.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDoVM: ToDoViewModel
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoVM.toDos) { toDo in
                    HStack {
                        Image(systemName: toDo.isFinished ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDoVM.toggleCheckbox(toDo: toDo)
                            }
                        
                        NavigationLink {
                            DetailView(toDo: toDo)
                                .navigationBarBackButtonHidden(true)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            Text(toDo.item)
                        }
                        
                    }
                    .font(.title2)
                }
                .onDelete { indexSet in
                    toDoVM.deleteToDo(indexSet: indexSet)
                }
                .onMove { fromOffsets , toOffset in
                    toDoVM.moveToDo(fromOffsets: fromOffsets, toOffset: toOffset)
                }
            }
            .navigationTitle("Your ToDo List")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationView {
                    DetailView(toDo: ToDo())
                        .navigationBarTitle("Enter a new note")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDoViewModel())
    }
}


