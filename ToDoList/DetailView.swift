//
//  DetailView.swift
//  ToDoList
//
//  Created by Nikola Zivkovic on 8/12/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDoVM: ToDoViewModel
    @State var toDo: ToDo
    var newToDo = false
    
    var body: some View {
            List {
                TextField("Enter your text here", text: $toDo.item)
                    .font(.title2)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set reminder", isOn: $toDo.reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $toDo.dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!toDo.reminderIsOn)
                
                Text("Notes:")
                TextField("Notes", text: $toDo.notes)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed", isOn: $toDo.isFinished)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        toDoVM.saveToDo(toDo: toDo, newToDo: newToDo)
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(toDo: ToDo())
                .environmentObject(ToDoViewModel())
        }
    }
}
