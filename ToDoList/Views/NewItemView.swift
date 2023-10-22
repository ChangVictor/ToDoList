//
//  NewItemView.swift
//  ToDoList
//
//  Created by Victor Chang on 06/10/2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item View")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                // Button
                TLButton(
                    title: "Save",
                    background: .pink
                ) {

                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        // show alert
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all field and select due date newer than today."))
            }
        }
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
