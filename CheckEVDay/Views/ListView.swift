//
//  ListView.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ListView: View {
    @StateObject var viewModel: ListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: ListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ListItemView(item: item)
                        .swipeActions {
                            Button("삭제") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewitemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ListView(userId: "B8KYKlCfp0RVspgFHzxiSWjuxgQ2")
}
