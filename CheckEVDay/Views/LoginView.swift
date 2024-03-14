//
//  LoginView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var Email = ""
    @State var Password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "Check Every Day",
                           subtitle: "매일 매일 확인하는 할일",
                           angle: 15,
                           background: .purple)
                
                //Login Form
                Form {
                    TextField("Email Address", text: $Email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $Password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        //Attempt log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.purple)
                            
                            Text("Log in")
                                .bold()
                                .foregroundColor(Color.white)
                        }
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
