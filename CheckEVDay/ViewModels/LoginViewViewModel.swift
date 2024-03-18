//
//  LoginViewViewModel.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
       
        guard validate() else {
            return
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "모든 입력칸을 채워주세요"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "유요한 이메일 주소를 작성하세요"
            return false
        }
        
        return true
    }
}
