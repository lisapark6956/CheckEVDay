//
//  ListView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //action
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

#Preview {
    ListView(userId: "")
}
