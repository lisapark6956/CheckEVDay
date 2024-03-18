//
//  RegisterView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //Header
            HeaderView(title: "계정 등록",
                       subtitle: "할일을 정리해 봐요",
                       angle: -15,
                       background: .red)
            
            Form {
                TextField("이름", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("이메일 주소", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("비밀번호", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton (
                    title: "계정 생성",
                    background: .pink
                ) {
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
