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
            ListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
