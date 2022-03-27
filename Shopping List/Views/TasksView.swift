//
//  TasksView.swift
//  Shopping List
//
//  Created by Marcus Grant on 3/25/22.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var RealmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("My List")
                .font(.title3).bold()
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if RealmManager.tasks.isEmpty {
                Text("Your list is empty")
                    .fontWeight(.light)
                    .foregroundColor(.black)
            }
            
            List {
                ForEach(RealmManager.tasks, id: \.id) {
                    task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                        .onTapGesture {
                            RealmManager.updateTask(id: task.id, completed: !task.completed)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                RealmManager.deleteTask(id: task.id)
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}

