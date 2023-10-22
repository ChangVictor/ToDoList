//
//  RegisterView.swift
//  ToDoList
//
//  Created by Victor Chang on 06/10/2023.
//

import SwiftUI

struct RegisterView: View {

    @State var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Start organizing todos",
                       angle: -15,
                       background: .orange)

            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Adress", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account",
                         background: .green) {
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            Spacer()
        }
    }
}

struct NRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
