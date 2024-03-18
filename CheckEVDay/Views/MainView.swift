//
//  ContentView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()

    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
          accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home",
                          systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile",
                          systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
