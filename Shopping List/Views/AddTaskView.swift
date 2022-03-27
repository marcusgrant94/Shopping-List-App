//
//  AddTaskView.swift
//  Shopping List
//
//  Created by Marcus Grant on 3/25/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmMaanger: RealmManager
    @State private var title: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new item")
                .foregroundColor(.black)
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your item here",
                      text: $title)
            .textFieldStyle(.roundedBorder)

            
            Button {
                if title != "" {
                    realmMaanger.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Add item")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328,
                                      saturation: 0.796, brightness: 0.408))
                    .cornerRadius(30)
                
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
