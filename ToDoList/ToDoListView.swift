//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Nikola Zivkovic on 8/12/23.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = [
        "Vacuuming the floors",
        "Dusting the surfaces",
        "Washing the dishes",
        "Taking out the trash",
        "Sweeping the floors",
        "Cleaning the windows",
        "Laundry (washing and folding)",
        "Making the bed",
        "Wiping down kitchen counters",
        "Mopping the floors",
        "Watering the plants",
        "Cleaning the bathroom",
        "Organizing cluttered areas",
        "Changing bed linens",
        "Cleaning out the fridge",
        "Wiping down appliances",
        "Vacuuming carpets and rugs",
        "Scrubbing the stove and oven",
        "Cleaning mirrors and glass surfaces",
        "Dusting and wiping electronics"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: "\(toDo)")
                    } label: {
                        Text("\(toDo)")
                    }

                }
            }
            .navigationTitle("Gg Son how you doing")
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}


