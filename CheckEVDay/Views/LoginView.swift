//
//  LoginView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Check Every Day",
                           subtitle: "매일 매일 확인하는 할일",
                           angle: 15,
                           background: .purple)
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton (
                        title: "Log In",
                        background: .purple
                    ) {
                        viewModel.login()
                    }
                }
                .offset(y:  -50)
                
                //Create Account
                VStack {
                    Text("처음 오셨습니까?")
                    NavigationLink("계정 생성", destination: RegisterView())
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
