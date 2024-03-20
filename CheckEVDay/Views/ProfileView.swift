//
//  ProfileView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("계정정보를 로딩중입니다...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.purple)
            .frame(width: 125, height: 125)
            .padding()
        
        // Info: Name, Email, Member since
        VStack(alignment: .leading) {
            HStack {
                Text("이름: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("이메일: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("가입 일자: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        // Sign out
        Button("로그아웃") {
            viewModel.logOut()
        }
        .tint(Color.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
